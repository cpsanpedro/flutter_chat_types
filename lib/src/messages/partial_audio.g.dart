// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partial_audio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartialAudio _$PartialAudioFromJson(Map<String, dynamic> json) => PartialAudio(
      length: Duration(milliseconds: json['length'] as int),
      metadata: json['metadata'] as Map<String, dynamic>?,
      mimeType: json['mimeType'] as String?,
      name: json['name'] as String,
      repliedMessage: json['repliedMessage'] == null
          ? null
          : Message.fromJson(json['repliedMessage'] as Map<String, dynamic>),
      size: json['size'] as num?,
      uri: json['uri'] as String,
      waveForm: json['waveForm'] as List<dynamic>,
    );

Map<String, dynamic> _$PartialAudioToJson(PartialAudio instance) {
  final val = <String, dynamic>{
    'length': instance.length.inMilliseconds,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('metadata', instance.metadata);
  writeNotNull('mimeType', instance.mimeType);
  val['name'] = instance.name;
  writeNotNull('repliedMessage', instance.repliedMessage?.toJson());
  val['size'] = instance.size;
  val['uri'] = instance.uri;
  writeNotNull('waveForm', instance.waveForm);
  return val;
}
