import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mydj/components/video_preview.dart';

enum MediaType { photo, video }

class MediaSelector extends StatefulWidget {
  final MediaType mediaType;

  const MediaSelector({super.key, this.mediaType = MediaType.photo});

  @override
  State<MediaSelector> createState() => _MediaSelectorState();
}

class _MediaSelectorState extends State<MediaSelector> {
  String _mediaPath = '';

  Widget _mediaPlaceholder() {
    final isPhoto = widget.mediaType == MediaType.photo;
    if (_mediaPath.isEmpty) {
      return SizedBox(
        height: 56,
        child: Row(
          children: [
            Icon(
              isPhoto ? Icons.image_not_supported : Icons.videocam_off,
              color: Colors.grey,
            ),
            const SizedBox(width: 8),
            Text(isPhoto ? 'No photo' : 'No video'),
          ],
        ),
      );
    }
    return isPhoto
        ? Image.file(File(_mediaPath), width: double.infinity, fit: BoxFit.fitWidth)
        : VideoPreview(path: _mediaPath);
  }

  Future<XFile?> _retrieveMedia(ImageSource source) {
    final picker = ImagePicker();
    return widget.mediaType == MediaType.photo
        ? picker.pickImage(source: source)
        : picker.pickVideo(source: source);
  }

  Future<void> _selectFromCamera() async {
    final media = await _retrieveMedia(ImageSource.camera);
    if (media != null && mounted) setState(() => _mediaPath = media.path);
  }

  Future<void> _selectFromGallery() async {
    final media = await _retrieveMedia(ImageSource.gallery);
    if (media != null && mounted) setState(() => _mediaPath = media.path);
  }

  void _deleteSelected() => setState(() => _mediaPath = '');

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: _mediaPlaceholder(),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            color: Colors.blue[50],
            child: Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: _selectFromCamera,
                    child: const Icon(Icons.photo_camera),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: FilledButton(
                    onPressed: _selectFromGallery,
                    child: const Icon(Icons.photo_library),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: FilledButton(
                    onPressed: _deleteSelected,
                    child: const Icon(Icons.delete),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
