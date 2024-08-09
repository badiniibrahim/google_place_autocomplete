/// Represents the response from the Google Place Autocomplete API.
///
/// This class contains the results of the auto-completion query, including
/// a list of predictions and the status of the request.
class GooglePlaceAutocompleteResponse {
  /// A list of predictions for the auto-completion query.
  ///
  /// Each prediction represents a possible place based on the input term.
  final List<Prediction>? predictions;

  /// The status of the API request.
  ///
  /// This indicates whether the request was successful and provides additional
  /// information about the request's result.
  final String? status;

  /// An optional error message related to the request.
  ///
  /// This field is used to capture any error information if the request fails.
  String? error;

  /// Creates a [GooglePlaceAutocompleteResponse] instance.
  ///
  /// - [predictions]: A list of [Prediction] objects.
  /// - [status]: The status of the API request.
  GooglePlaceAutocompleteResponse({
    this.predictions,
    this.status,
  });

  /// Creates a [GooglePlaceAutocompleteResponse] from a JSON map.
  ///
  /// - [json]: A dynamic JSON object that represents the response data.
  ///
  /// Returns a [GooglePlaceAutocompleteResponse] with data parsed from the JSON map.
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

/// Represents a prediction result from the Google Place Autocomplete API.
///
/// Each prediction provides details about a possible place matching the query.
class Prediction {
  /// A description of the predicted place.
  ///
  /// This provides a textual description of the place based on the input query.
  final String? description;

  /// A list of matched substrings within the prediction description.
  ///
  /// This indicates which parts of the description matched the input query.
  final List<MatchedSubstring>? matchedSubstrings;

  /// A unique identifier for the place.
  ///
  /// This ID can be used to fetch more details about the place.
  final String? placeId;

  /// A reference string for the place.
  ///
  /// This can be used in combination with the place ID for further operations.
  final String? reference;

  /// Structured formatting information for the prediction.
  ///
  /// This provides additional formatting details for the place description.
  final StructuredFormatting? structuredFormatting;

  /// A list of terms that make up the prediction description.
  ///
  /// Each term represents a distinct part of the place description.
  final List<Term>? terms;

  /// A list of types associated with the prediction.
  ///
  /// This indicates the types of places that match the input query.
  final List<String>? types;

  /// Creates a [Prediction] instance.
  ///
  /// - [description]: The description of the place.
  /// - [matchedSubstrings]: The matched substrings in the description.
  /// - [placeId]: The unique identifier for the place.
  /// - [reference]: The reference string for the place.
  /// - [structuredFormatting]: Structured formatting information.
  /// - [terms]: The terms that make up the prediction description.
  /// - [types]: The types associated with the prediction.
  Prediction({
    this.description,
    this.matchedSubstrings,
    this.placeId,
    this.reference,
    this.structuredFormatting,
    this.terms,
    this.types,
  });

  /// Creates a [Prediction] from a JSON map.
  ///
  /// - [json]: A dynamic JSON object that represents the prediction data.
  ///
  /// Returns a [Prediction] with data parsed from the JSON map.
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

/// Represents a substring within the prediction description that matches the query.
///
/// This class is used to highlight parts of the description that match the user's input.
class MatchedSubstring {
  /// The length of the matched substring.
  ///
  /// This indicates how many characters in the description match the query.
  final int? length;

  /// The starting position of the matched substring.
  ///
  /// This indicates where the match begins within the description.
  final int? offset;

  /// Creates a [MatchedSubstring] instance.
  ///
  /// - [length]: The length of the matched substring.
  /// - [offset]: The starting position of the matched substring.
  MatchedSubstring({
    this.length,
    this.offset,
  });

  /// Creates a [MatchedSubstring] from a JSON map.
  ///
  /// - [json]: A dynamic JSON object that represents the matched substring data.
  ///
  /// Returns a [MatchedSubstring] with data parsed from the JSON map.
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

/// Represents the structured formatting of the prediction.
///
/// This class provides additional information on how the prediction description
/// should be displayed, including matched substrings for the main text.
class StructuredFormatting {
  /// The main text of the prediction.
  ///
  /// This is the primary textual representation of the place.
  final String? mainText;

  /// A list of matched substrings within the main text.
  ///
  /// This indicates which parts of the main text matched the input query.
  final List<MatchedSubstring>? mainTextMatchedSubstrings;

  /// The secondary text of the prediction.
  ///
  /// This provides additional details about the place, displayed below the main text.
  final String? secondaryText;

  /// Creates a [StructuredFormatting] instance.
  ///
  /// - [mainText]: The main text of the prediction.
  /// - [mainTextMatchedSubstrings]: Matched substrings within the main text.
  /// - [secondaryText]: The secondary text of the prediction.
  StructuredFormatting({
    this.mainText,
    this.mainTextMatchedSubstrings,
    this.secondaryText,
  });

  /// Creates a [StructuredFormatting] from a JSON map.
  ///
  /// - [json]: A dynamic JSON object that represents the structured formatting data.
  ///
  /// Returns a [StructuredFormatting] with data parsed from the JSON map.
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

/// Represents a term within the prediction description.
///
/// Each term is a part of the description and provides additional details
/// about the place.
class Term {
  /// The starting position of the term in the description.
  ///
  /// This indicates where the term begins within the description.
  final int? offset;

  /// The value of the term.
  ///
  /// This is the textual representation of the term.
  final String? value;

  /// Creates a [Term] instance.
  ///
  /// - [offset]: The starting position of the term in the description.
  /// - [value]: The value of the term.
  Term({
    this.offset,
    this.value,
  });

  /// Creates a [Term] from a JSON map.
  ///
  /// - [json]: A dynamic JSON object that represents the term data.
  ///
  /// Returns a [Term] with data parsed from the JSON map.
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
