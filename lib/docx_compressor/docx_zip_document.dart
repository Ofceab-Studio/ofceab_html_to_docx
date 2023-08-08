import 'dart:io';
import 'package:ofceab_docx_builder/components/base_components.dart';
import 'package:archive/archive.dart';

abstract class IDocxCompressor {
  IExportableComponent get mainDocument;
  IExportableComponent get contentTypeDocument;
  IExportableComponent get relsDocument;

  /// Compress document and return compressed file in binary format
  List<int> compress();
}

class DocxCompressor implements IDocxCompressor {
  final ZipEncoder _zipEncoder;
  final Archive _zipArchiver;

  DocxCompressor(
      {required this.contentTypeDocument,
      required this.mainDocument,
      required this.relsDocument})
      : _zipEncoder = ZipEncoder(),
        _zipArchiver = Archive();

  @override
  final IExportableComponent contentTypeDocument;

  @override
  final IExportableComponent mainDocument;

  @override
  final IExportableComponent relsDocument;

  @override
  List<int> compress() {
    // Add document.xml in zp archive
    mainDocument.buildDocument();

    final mainDocumentData = mainDocument.xmlContent;
    final contentTypeDocumentData = contentTypeDocument.xmlContent;
    final relsDocumentData = relsDocument.xmlContent;

    print(relsDocumentData);

    _zipArchiver.addFile(ArchiveFile(
        mainDocument.fileName, mainDocumentData.length, mainDocumentData));
    // Add content Type file
    _zipArchiver.addFile(ArchiveFile(contentTypeDocument.fileName,
        contentTypeDocumentData.length, contentTypeDocumentData));
    // Add rels file
    _zipArchiver.addFile(ArchiveFile(
        relsDocument.fileName, relsDocumentData.length, relsDocumentData));

    return _zipEncoder.encode(_zipArchiver) ?? [];
  }

  Future<File> compressToDocxFile(String filename) async {
    final outputFile = File(filename);
    final bytes = compress();
    await outputFile.writeAsBytes(bytes);
    return outputFile;
  }
}
