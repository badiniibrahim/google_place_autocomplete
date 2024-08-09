class GooglePlaceAutocompleteResponse {
  final List<Prediction>? predictions;
  final String? status;

  String? error;

  GooglePlaceAutocompleteResponse({
    this.predictions,
    this.status,
  });

  factory GooglePlaceAutocompleteResponse.fromJson(dynamic json) {
    if (json == null) {
      return GooglePlaceAutocompleteResponse();
    }

    return GooglePlaceAutocompleteResponse(
      predictions: json['predictions'] != null
          ? List<Prediction>.from(
              json['predictions'].map((x) => Prediction.fromJson(x)))
          : null,
      status: json['status'],
    );
  }
}

class Prediction {
  final String? description;
  final List<MatchedSubstring>? matchedSubstrings;
  final String? placeId;
  final String? reference;
  final StructuredFormatting? structuredFormatting;
  final List<Term>? terms;
  final List<String>? types;

  Prediction({
    this.description,
    this.matchedSubstrings,
    this.placeId,
    this.reference,
    this.structuredFormatting,
    this.terms,
    this.types,
  });

  factory Prediction.fromJson(dynamic json) {
    if (json == null) {
      return Prediction();
    }

    return Prediction(
      description: json['description'],
      matchedSubstrings: json['matched_substrings'] != null
          ? List<MatchedSubstring>.from(json['matched_substrings']
              .map((x) => MatchedSubstring.fromJson(x)))
          : null,
      placeId: json['place_id'],
      reference: json['reference'],
      structuredFormatting: json['structured_formatting'] != null
          ? StructuredFormatting.fromJson(json['structured_formatting'])
          : null,
      terms: json['terms'] != null
          ? List<Term>.from(json['terms'].map((x) => Term.fromJson(x)))
          : null,
      types: json['types'] != null
          ? List<String>.from(json['types'].map((x) => x))
          : null,
    );
  }
}

class MatchedSubstring {
  final int? length;
  final int? offset;

  MatchedSubstring({
    this.length,
    this.offset,
  });

  factory MatchedSubstring.fromJson(dynamic json) {
    if (json == null) {
      return MatchedSubstring();
    }

    return MatchedSubstring(
      length: json['length'],
      offset: json['offset'],
    );
  }
}

class StructuredFormatting {
  final String? mainText;
  final List<MatchedSubstring>? mainTextMatchedSubstrings;
  final String? secondaryText;

  StructuredFormatting({
    this.mainText,
    this.mainTextMatchedSubstrings,
    this.secondaryText,
  });

  factory StructuredFormatting.fromJson(dynamic json) {
    if (json == null) {
      return StructuredFormatting();
    }

    return StructuredFormatting(
      mainText: json['main_text'],
      mainTextMatchedSubstrings: json['main_text_matched_substrings'] != null
          ? List<MatchedSubstring>.from(json['main_text_matched_substrings']
              .map((x) => MatchedSubstring.fromJson(x)))
          : null,
      secondaryText: json['secondary_text'],
    );
  }
}

class Term {
  final int? offset;
  final String? value;

  Term({
    this.offset,
    this.value,
  });

  factory Term.fromJson(dynamic json) {
    if (json == null) {
      return Term();
    }

    return Term(
      offset: json['offset'],
      value: json['value'],
    );
  }
}
