import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../message.dart';
import '../user.dart' show User;
import 'partial_audio.dart';

part 'audio_message.g.dart';

/// A class that represents audio message.
@JsonSerializable()
@immutable
abstract class AudioMessage extends Message {
  /// Creates an audio message.
  const AudioMessage._({
    required super.author,
    super.createdAt,
    required this.length,
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
    this.waveForm,
  }) : super(type: type ?? MessageType.audio);

  const factory AudioMessage({
    required User author,
    int? createdAt,
    required Duration length,
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
    List<dynamic>? waveForm,
  }) = _AudioMessage;

  /// Creates an audio message from a map (decoded JSON).
  factory AudioMessage.fromJson(Map<String, dynamic> json) =>
      _$AudioMessageFromJson(json);

  /// Creates a full audio message from a partial one.
  factory AudioMessage.fromPartial({
    required User author,
    int? createdAt,
    required String id,
    required PartialAudio partialAudio,
    String? remoteId,
    String? roomId,
    bool? showStatus,
    Status? status,
    int? updatedAt,
  }) =>
      _AudioMessage(
        author: author,
        createdAt: createdAt,
        length: partialAudio.length,
        id: id,
        metadata: partialAudio.metadata,
        mimeType: partialAudio.mimeType,
        name: partialAudio.name,
        remoteId: remoteId,
        repliedMessage: partialAudio.repliedMessage,
        roomId: roomId,
        showStatus: showStatus,
        size: partialAudio.size,
        status: status,
        type: MessageType.audio,
        updatedAt: updatedAt,
        uri: partialAudio.uri,
        waveForm: partialAudio.waveForm,
      );

  /// The length of the audio.
  final Duration length;

  /// Media type of the audio file.
  final String? mimeType;

  /// The name of the audio.
  final String name;

  /// Size of the audio in bytes.
  final num? size;

  /// The audio file source (either a remote URL or a local resource).
  final String uri;

  /// Wave form represented as a list of decibel levels.
  final List<dynamic>? waveForm;

  /// Equatable props.
  @override
  List<Object?> get props => [
        author,
        createdAt,
        length,
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
        waveForm,
      ];

  @override
  Message copyWith({
    User? author,
    int? createdAt,
    Duration? length,
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
    List<dynamic>? waveForm,
  });

  /// Converts an audio message to the map representation, encodable to JSON.
  @override
  Map<String, dynamic> toJson() => _$AudioMessageToJson(this);
}

/// A utility class to enable better copyWith.
class _AudioMessage extends AudioMessage {
  const _AudioMessage({
    required super.author,
    super.createdAt,
    required super.length,
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
    super.waveForm,
  }) : super._();

  @override
  Message copyWith({
    User? author,
    dynamic createdAt = _Unset,
    Duration? length,
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
    dynamic waveForm = _Unset,
  }) =>
      _AudioMessage(
        author: author ?? this.author,
        createdAt: createdAt == _Unset ? this.createdAt : createdAt as int?,
        length: length ?? this.length,
        id: id ?? this.id,
        metadata: metadata == _Unset
            ? this.metadata
            : metadata as Map<String, dynamic>?,
        mimeType: mimeType == _Unset ? this.mimeType : mimeType as String?,
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
        waveForm:
            waveForm == _Unset ? this.waveForm : waveForm as List<dynamic>?,
      );
}

class _Unset {}
