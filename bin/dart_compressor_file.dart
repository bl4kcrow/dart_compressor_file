import 'dart:io';

import 'package:archive/archive_io.dart';

void main(List<String> arguments) {
  print('COMPRESSOR FILE');
  compressToZip(
    '',
    'Orden-Cita80657600.pdf',
  );
}

void compressToZip(
  String filePath,
  String fileName,
) {
  final path = '$filePath$fileName';
  final bytes = File(path).readAsBytesSync();
  final archiveFile = ArchiveFile(
    fileName,
    bytes.length,
    bytes,
  );
  final archive = Archive();
  archive.addFile(archiveFile);

  final zipData = ZipEncoder().encode(archive);
  if (zipData?.isNotEmpty == true) {
    final fileNameNoExtension = fileName.substring(
      0,
      fileName.lastIndexOf('.'),
    );
    final zipFileName = '$fileNameNoExtension.zip';
    final zipFile = File(zipFileName);
    zipFile.writeAsBytesSync(zipData!);
  }
}
