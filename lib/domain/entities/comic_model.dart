import 'package:comic_book/domain/entities/basic_details_model.dart';

import 'associated_image.dart';
import 'image_model.dart';

class ComicModel {
  final String? aliases;
  final String? apiDetailUrl;
  final String? coverDate;
  final String? dateAdded;
  final String? dateLastUpdated;
  final String? deck;
  final String? description;
  final bool? hasStaffReview;
  final int id;
  final ImageModel? image;
  final List<AssociatedImage>? associatedImages;
  final String? issueNumber;
  final String? name;
  final String? siteDetailUrl;
  final String? storeDate;
  final BasicDetailsModel? volume;
  final BasicDetailsModel? publisher;
  final List<BasicDetailsModel>? characters;
  final List<BasicDetailsModel>? teams;
  final List<BasicDetailsModel>? locations;
  final List<BasicDetailsModel>? concepts;
  final List<BasicDetailsModel>? persons;

  ComicModel({
    this.aliases,
    this.apiDetailUrl,
    this.coverDate,
    this.dateAdded,
    this.dateLastUpdated,
    this.deck,
    this.description,
    this.hasStaffReview,
    required this.id,
    this.image,
    this.associatedImages,
    this.issueNumber,
    this.name,
    this.siteDetailUrl,
    this.storeDate,
    this.volume,
    this.publisher,
    this.characters,
    this.teams,
    this.locations,
    this.concepts,
    this.persons,
  });

  factory ComicModel.fromJson(Map<String, dynamic> json) {
    return ComicModel(
      aliases: json['aliases'],
      apiDetailUrl: json['api_detail_url'],
      coverDate: json['cover_date'],
      dateAdded: json['date_added'],
      dateLastUpdated: json['date_last_updated'],
      deck: json['deck'],
      description: json['description'],
      hasStaffReview: json['has_staff_review'],
      id: json['id'],
      image: json['image'] != null ? ImageModel.fromJson(json['image']) : null,
      associatedImages: json['associated_images'] != null
          ? (json['associated_images'] as List)
              .map((team) => AssociatedImage.fromJson(team))
              .toList()
          : null,
      issueNumber: json['issue_number'],
      name: json['name'] ?? '-',
      siteDetailUrl: json['site_detail_url'],
      storeDate: json['store_date'] ?? '-',
      volume: json['volume'] != null ? BasicDetailsModel.fromJson(json['volume']) : null,
      publisher: json['publisher'] != null
          ? BasicDetailsModel.fromJson(json['publisher'])
          : null,
      characters: json['characters'] != null
          ? (json['characters'] as List)
              .map((character) => BasicDetailsModel.fromJson(character))
              .toList()
          : null,
      teams: json['team_credits'] != null
          ? (json['team_credits'] as List)
              .map((team) => BasicDetailsModel.fromJson(team))
              .toList()
          : null,
      locations: json['location_credits'] != null
          ? (json['location_credits'] as List)
              .map((location) => BasicDetailsModel.fromJson(location))
              .toList()
          : null,
      concepts: json['concept_credits'] != null
          ? (json['concept_credits'] as List)
              .map((concept) => BasicDetailsModel.fromJson(concept))
              .toList()
          : null,
      persons: json['person_credits'] != null
          ? (json['person_credits'] as List)
              .map((person) => BasicDetailsModel.fromJson(person))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'aliases': aliases,
      'api_detail_url': apiDetailUrl,
      'cover_date': coverDate,
      'date_added': dateAdded,
      'date_last_updated': dateLastUpdated,
      'deck': deck,
      'description': description,
      'has_staff_review': hasStaffReview,
      'id': id,
      'image': image?.toJson(),
      'associated_images':
          associatedImages?.map((image) => image.toJson()).toList(),
      'issue_number': issueNumber,
      'name': name,
      'site_detail_url': siteDetailUrl,
      'store_date': storeDate,
      'volume': volume?.toJson(),
      'publisher': publisher?.toJson(),
      'characters': characters?.map((character) => character.toJson()).toList(),
      'teams': teams?.map((team) => team.toJson()).toList(),
      'locations': locations?.map((location) => location.toJson()).toList(),
      'concepts': concepts?.map((concept) => concept.toJson()).toList(),
      'persons': persons?.map((person) => person.toJson()).toList(),
    };
  }
}
