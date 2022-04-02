// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieAdapter extends TypeAdapter<Movie> {
  @override
  final int typeId = 0;

  @override
  Movie read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Movie(
      runtime: fields[12] as int,
      genreIds: (fields[2] as List).cast<int>(),
      backdropPath: fields[0] as String,
      id: fields[1] as int,
      originalLanguage: fields[3] as String,
      originalTitle: fields[4] as String,
      overview: fields[5] as String,
      posterPath: fields[6] as String,
      releaseDate: fields[7] as String,
      title: fields[8] as String,
      video: fields[9] as bool,
      voteCount: fields[10] as int,
      voteAverage: fields[11] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Movie obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.backdropPath)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.genreIds)
      ..writeByte(3)
      ..write(obj.originalLanguage)
      ..writeByte(4)
      ..write(obj.originalTitle)
      ..writeByte(5)
      ..write(obj.overview)
      ..writeByte(6)
      ..write(obj.posterPath)
      ..writeByte(7)
      ..write(obj.releaseDate)
      ..writeByte(8)
      ..write(obj.title)
      ..writeByte(9)
      ..write(obj.video)
      ..writeByte(10)
      ..write(obj.voteCount)
      ..writeByte(11)
      ..write(obj.voteAverage)
      ..writeByte(12)
      ..write(obj.runtime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
