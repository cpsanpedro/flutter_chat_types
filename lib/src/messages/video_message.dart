import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../message.dart';
import '../user.dart' show User;
import 'partial_video.dart';

part 'video_message.g.dart';

/// A class that represents video message.
@JsonSerializable()
@immutable
abstract class VideoMessage extends Message {
  /// Creates a video message.
  const VideoMessage._({
    required super.author,
    super.createdAt,
    required this.length,
    this.height,
    required super.id,
    super.metadata,
    this.mimeType,
    required this.name,
    super.remoteId,
    super.repliedMessage,
    super.roomId,
    super.showStatus,
    this.size,
    super.status,
    MessageType? type,
    super.updatedAt,
    required this.uri,
    this.width,
  }) : super(type: type ?? MessageType.video);

  const factory VideoMessage({
    required User author,
    int? createdAt,
    required Duration length,
    double? height,
    required String id,
    Map<String, dynamic>? metadata,
    String? mimeType,
    required String name,
    String? remoteId,
    Message? repliedMessage,
    String? roomId,
    bool? showStatus,
    num? size,
    Status? status,
    MessageType? type,
    int? updatedAt,
    required String uri,
    double? width,
  }) = _VideoMessage;

  /// Creates a video message from a map (decoded JSON).
  factory VideoMessage.fromJson(Map<String, dynamic> json) =>
      _$VideoMessageFromJson(json);

  /// Creates a full video message from a partial one.
  factory VideoMessage.fromPartial({
    required User author,
    int? createdAt,
    required String id,
    required PartialVideo partialVideo,
    String? remoteId,
    String? roomId,
    bool? showStatus,
    Status? status,
    int? updatedAt,
  }) =>
      _VideoMessage(
        author: author,
        createdAt: createdAt,
        length: partialVideo.length,
        height: partialVideo.height,
        id: id,
        metadata: partialVideo.metadata,
        mimeType: partialVideo.mimeType,
        name: partialVideo.name,
        remoteId: remoteId,
        repliedMessage: partialVideo.repliedMessage,
        roomId: roomId,
        showStatus: showStatus,
        size: partialVideo.size,
        status: status,
        type: MessageType.video,
        updatedAt: updatedAt,
        uri: partialVideo.uri,
        width: partialVideo.width,
      );

  /// Video height in pixels.
  final double? height;

  /// The name of the video.
  final String name;

  /// Size of the video in bytes.
  final num? size;

  /// The video source (either a remote URL or a local resource).
  final String uri;

  /// Video width in pixels.
  final double? width;

    /// The length of the video
  final Duration length;

  /// Media type
  final String? mimeType;

  /// Equatable props.
  @override
  List<Object?> get props => [
        author,
        createdAt,
        length,
        height,
        id,
        metadata,
        mimeType,
        name,
        remoteId,
        repliedMessage,
        roomId,
        showStatus,
        size,
        status,
        updatedAt,
        uri,
        width,
      ];

  @override
  Message copyWith({
    User? author,
    int? createdAt,
    Duration? length,
    double? height,
    String? id,
    Map<String, dynamic>? metadata,
    String? mimeType,
    String? name,
    String? remoteId,
    Message? repliedMessage,
    String? roomId,
    bool? showStatus,
    num? size,
    Status? status,
    int? updatedAt,
    String? uri,
    double? width,
  });

  /// Converts an video message to the map representation, encodable to JSON.
  @override
  Map<String, dynamic> toJson() => _$VideoMessageToJson(this);
}

/// A utility class to enable better copyWith.
class _VideoMessage extends VideoMessage {
  const _VideoMessage({
    required super.author,
    super.createdAt,
    required super.length,
    super.height,
    required super.id,
    super.metadata,
    super.mimeType,
    required super.name,
    super.remoteId,
    super.repliedMessage,
    super.roomId,
    super.showStatus,
    super.size,
    super.status,
    super.type,
    super.updatedAt,
    required super.uri,
    super.width,
  }) : super._();

  @override
  Message copyWith({
    User? author,
    dynamic createdAt = _Unset,
    Duration? length,
    dynamic height = _Unset,
    String? id,
    dynamic metadata = _Unset,
    dynamic mimeType = _Unset,
    String? name,
    dynamic remoteId = _Unset,
    dynamic repliedMessage = _Unset,
    dynamic roomId,
    dynamic showStatus = _Unset,
    num? size,
    dynamic status = _Unset,
    dynamic updatedAt = _Unset,
    String? uri,
    dynamic width = _Unset,
  }) =>
      _VideoMessage(
        length: length ?? this.length,
        mimeType: mimeType == _Unset ? this.mimeType : mimeType as String?,
        author: author ?? this.author,
        createdAt: createdAt == _Unset ? this.createdAt : createdAt as int?,
        height: height == _Unset ? this.height : height as double?,
        id: id ?? this.id,
        metadata: metadata == _Unset
            ? this.metadata
            : metadata as Map<String, dynamic>?,
        name: name ?? this.name,
        remoteId: remoteId == _Unset ? this.remoteId : remoteId as String?,
        repliedMessage: repliedMessage == _Unset
            ? this.repliedMessage
            : repliedMessage as Message?,
        roomId: roomId == _Unset ? this.roomId : roomId as String?,
        showStatus:
            showStatus == _Unset ? this.showStatus : showStatus as bool?,
        size: size ?? this.size,
        status: status == _Unset ? this.status : status as Status?,
        updatedAt: updatedAt == _Unset ? this.updatedAt : updatedAt as int?,
        uri: uri ?? this.uri,
        width: width == _Unset ? this.width : width as double?,
      );
}

class _Unset {}
