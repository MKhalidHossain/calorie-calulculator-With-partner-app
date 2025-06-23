import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shevaandrii/core/themes/app_theme.dart';
import 'photo_analyze_screen.dart';

class TakePhotoScreen extends StatefulWidget {
  const TakePhotoScreen({super.key});

  @override
  State<TakePhotoScreen> createState() => _TakePhotoScreenState();
}

class _TakePhotoScreenState extends State<TakePhotoScreen> {
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;
  bool _isCameraInitialized = false;
  bool _cameraError = false;
  double _currentZoomLevel = 1.0;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final status = await Permission.camera.request();
    if (status.isGranted) {
      try {
        _cameras = await availableCameras();
        if (_cameras == null || _cameras!.isEmpty) {
          setState(() => _cameraError = true);
          return;
        }

        _cameraController = CameraController(
          _cameras![0],
          ResolutionPreset.max,
          enableAudio: false,
        );

        await _cameraController!.initialize();
        if (!mounted) return;

        setState(() => _isCameraInitialized = true);
      } catch (e) {
        debugPrint("Camera error: $e");
        setState(() => _cameraError = true);
      }
    } else {
      setState(() => _cameraError = true);
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  void _capturePhoto() async {
    try {
      if (_cameraController == null || !_cameraController!.value.isInitialized)
        return;
      if (_cameraController!.value.isTakingPicture) return;

      final XFile file = await _cameraController!.takePicture();
      debugPrint("Photo captured: ${file.path}");

      if (!mounted) return;

      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => AnalyzeScreen(imagePath: file.path)),
      );
    } catch (e) {
      debugPrint("Capture error: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Capture failed: $e')));
    }
  }

  void _setZoom(double zoom) async {
    await _cameraController?.setZoomLevel(zoom);
    setState(() => _currentZoomLevel = zoom);
  }

  @override
  Widget build(BuildContext context) {
    return AppTheme.withGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body:
            _cameraError
                ? _buildErrorMessage()
                : !_isCameraInitialized
                ? _buildLoading()
                : Stack(
                  children: [
                    CameraPreview(_cameraController!),
                    Column(
                      children: [
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0xFFBAD5F0).withOpacity(0.8),
                            // gradient: LinearGradient(
                            //   colors: [Colors.black54, Colors.transparent],
                            //   begin: Alignment.bottomCenter,
                            //   end: Alignment.topCenter,
                            // ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            child: Column(
                              children: [
                                const SizedBox(height: 30),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                      ),
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                    const SizedBox(width: 10),
                                    const Text(
                                      'Log Meal',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        const Spacer(),
                        _buildZoomOptions(),
                        const SizedBox(height: 20),
                        _buildCaptureButton(),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ],
                ),
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildErrorMessage() {
    return const Center(
      child: Text(
        'Camera not available.\nPlease check permissions.',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildZoomOptions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _zoomOption(".7x", 0.7),
        _zoomOption("1x", 1.0),
        _zoomOption("2x", 2.0),
      ],
    );
  }

  Widget _zoomOption(String label, double zoom) {
    final bool isSelected = (_currentZoomLevel - zoom).abs() < 0.05;
    return GestureDetector(
      onTap: () => _setZoom(zoom),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.black45,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildCaptureButton() {
    return GestureDetector(
      onTap: () {
        debugPrint("Capture button tapped");
        _capturePhoto();
      },
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFD644).withOpacity(0.5),
          border: Border.all(color: Color(0xFFFFD644), width: 1),
        ),
        child: const Icon(Icons.camera_alt, size: 32, color: Colors.white),
      ),
    );
  }
}
