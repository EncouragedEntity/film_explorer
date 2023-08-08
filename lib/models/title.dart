import 'package:url_launcher/url_launcher.dart';

import '../constants/links.dart';
import 'writer.dart';
import 'cast_member.dart';
import 'director.dart';

class Title {
  final String id;
  int pageNumber = 1;
  String? primaryImageURL;
  String titleType = '';
  String titleText = '';
  String originalTitleText = '';
  int releaseYear = 0;
  int? releaseDateDay;
  int? releaseDateMonth;
  int? releaseDateYear;
  Map<String, dynamic> wins = {};
  Map<String, dynamic> nominations = {};
  dynamic prestigiousAwardSummary;
  Map<String, dynamic> ratingsSummary = {};
  dynamic episodes;
  Map<String, dynamic> videos = {};
  Map<String, dynamic> videoStrip = {};
  Map<String, dynamic> titleMainImages = {};
  dynamic productionStatus;
  dynamic primaryImage;
  Map<String, dynamic> imageUploadLink = {};
  bool canHaveEpisodes = false;
  List<CastMember> cast = [];
  Map<String, dynamic> principalCast = {};
  List<dynamic> creators = [];
  List<Director> directors = [];
  List<Writer> writers = [];
  bool isAdult = false;
  Map<String, dynamic> moreLikeThisTitles = {};
  Map<String, dynamic> summaries = {};
  Map<String, dynamic> outlines = {};
  Map<String, dynamic> synopses = {};
  Map<String, dynamic> storylineKeywords = {};
  Map<String, dynamic> taglines = {};
  Map<String, dynamic> genres = {};
  dynamic certificate;
  Map<String, dynamic> parentsGuide = {};
  Map<String, dynamic> triviaTotal = {};
  Map<String, dynamic> trivia = {};
  Map<String, dynamic> goofsTotal = {};
  Map<String, dynamic> goofs = {};
  Map<String, dynamic> quotesTotal = {};
  Map<String, dynamic> quotes = {};
  Map<String, dynamic> crazyCredits = {};
  Map<String, dynamic> alternateVersions = {};
  Map<String, dynamic> connections = {};
  Map<String, dynamic> soundtrack = {};
  Map<String, dynamic> reviews = {};
  Map<String, dynamic> featuredReviews = {};
  Map<String, dynamic> canRate = {};
  Map<String, dynamic> iframeAddReviewLink = {};
  Map<String, dynamic> faqsTotal = {};
  Map<String, dynamic> faqs = {};
  dynamic releaseDate;
  Map<String, dynamic> countriesOfOrigin = {};
  Map<String, dynamic> detailsExternalLinks = {};
  Map<String, dynamic> spokenLanguages = {};
  Map<String, dynamic> akas = {};
  Map<String, dynamic> filmingLocations = {};
  Map<String, dynamic> production = {};
  dynamic productionBudget;
  dynamic lifetimeGross;
  dynamic openingWeekendGross;
  dynamic worldwideGross;
  Map<String, dynamic> technicalSpecifications = {};
  dynamic runtime;
  dynamic series;
  Map<String, dynamic> news = {};
  Map<String, dynamic> contributionQuestions = {};
  dynamic meterRanking;
  Map<String, dynamic> images = {};
  Map<String, dynamic> primaryVideos = {};
  Map<String, dynamic> externalLinks = {};
  dynamic metacritic;
  Map<String, dynamic> keywords = {};
  dynamic plot;
  Map<String, dynamic> plotContributionLink = {};
  Map<String, dynamic> credits = {};
  List<dynamic> principalCredits = [];
  Map<String, dynamic> criticReviewsTotal = {};
  Map<String, dynamic> meta = {};
  Map<String, dynamic> castPageTitle = {};
  Map<String, dynamic> creatorsPageTitle = {};
  Map<String, dynamic> directorsPageTitle = {};

  Title({
    required this.id,
    this.pageNumber = 1,
    this.primaryImageURL,
    this.titleType = '',
    this.titleText = '',
    this.originalTitleText = '',
    this.releaseYear = 0,
    this.releaseDateDay,
    this.releaseDateMonth,
    this.releaseDateYear,
    this.wins = const {},
    this.nominations = const {},
    this.prestigiousAwardSummary,
    this.ratingsSummary = const {},
    this.episodes,
    this.videos = const {},
    this.videoStrip = const {},
    this.titleMainImages = const {},
    this.productionStatus,
    this.primaryImage,
    this.imageUploadLink = const {},
    this.canHaveEpisodes = false,
    this.cast = const [],
    this.principalCast = const {},
    this.creators = const [],
    this.directors = const [],
    this.writers = const [],
    this.isAdult = false,
    this.moreLikeThisTitles = const {},
    this.summaries = const {},
    this.outlines = const {},
    this.synopses = const {},
    this.storylineKeywords = const {},
    this.taglines = const {},
    this.genres = const {},
    this.certificate,
    this.parentsGuide = const {},
    this.triviaTotal = const {},
    this.trivia = const {},
    this.goofsTotal = const {},
    this.goofs = const {},
    this.quotesTotal = const {},
    this.quotes = const {},
    this.crazyCredits = const {},
    this.alternateVersions = const {},
    this.connections = const {},
    this.soundtrack = const {},
    this.reviews = const {},
    this.featuredReviews = const {},
    this.canRate = const {},
    this.iframeAddReviewLink = const {},
    this.faqsTotal = const {},
    this.faqs = const {},
    this.releaseDate,
    this.countriesOfOrigin = const {},
    this.detailsExternalLinks = const {},
    this.spokenLanguages = const {},
    this.akas = const {},
    this.filmingLocations = const {},
    this.production = const {},
    this.productionBudget,
    this.lifetimeGross,
    this.openingWeekendGross,
    this.worldwideGross,
    this.technicalSpecifications = const {},
    this.runtime,
    this.series,
    this.news = const {},
    this.contributionQuestions = const {},
    this.meterRanking,
    this.images = const {},
    this.primaryVideos = const {},
    this.externalLinks = const {},
    this.metacritic,
    this.keywords = const {},
    this.plot,
    this.plotContributionLink = const {},
    this.credits = const {},
    this.principalCredits = const [],
    this.criticReviewsTotal = const {},
    this.meta = const {},
    this.castPageTitle = const {},
    this.creatorsPageTitle = const {},
    this.directorsPageTitle = const {},
  });

  void updateWithDirectorAndWriterInfo(Map<String, dynamic> results) {
    try {
      directors =
          (results['results']['directors'][0]['credits'] as List<dynamic>)
              .map<Director>((creditNode) {
        return Director(
            id: creditNode['name']['id'],
            name: creditNode['name']['nameText']['text']);
      }).toList();
    } catch (error) {
      directors = [];
    }
    try {
      writers = (results['results']['writers'][0]['credits'] as List<dynamic>)
          .map<Writer>((creditNode) {
        return Writer(
            id: creditNode['name']['id'],
            name: creditNode['name']['nameText']['text']);
      }).toList();
    } catch (error) {
      writers = [];
    }
  }

  void updateWithCastInfo(Map<String, dynamic> results) {
    cast = (results['results']['cast']['edges'] as List<dynamic>)
        .map<CastMember>((castNode) {
      final castData = castNode['node'] as Map<String, dynamic>;
      return CastMember.fromJson(castData);
    }).toList();
  }
  
    Future<void> openInBrowser() async
  {
    if(!await launchUrl(Uri.parse('$imdbTitle/$id')))
    {
      throw Exception('Could not find url');
    }
  }

  factory Title.fromJson(Map<String, dynamic> json, {int? pageNumber}) {
    final results = json['results'] as Map<String, dynamic>?;

    List<Director> directors = [];

    List<Writer> writers = [];

    List<CastMember> cast = [];

    if (results != null) {
      final primaryImage = results['primaryImage'] as Map<String, dynamic>?;

      return Title(
        pageNumber: pageNumber ?? 1,
        id: results['id'],
        primaryImageURL: primaryImage?['url'] ?? '',
        titleType: results['titleType']['text'],
        titleText: results['titleText']['text'],
        originalTitleText: results['originalTitleText']['text'],
        releaseYear: results['releaseYear']['year'],
        releaseDateDay: results['releaseDate']?['day'],
        releaseDateMonth: results['releaseDate']?['month'],
        releaseDateYear: results['releaseDate']?['year'],
        wins: results['wins'] ?? {},
        nominations: results['nominations'] ?? {},
        prestigiousAwardSummary: results['prestigiousAwardSummary'],
        ratingsSummary: results['ratingsSummary'] ?? {},
        episodes: results['episodes'],
        videos: results['videos'] ?? {},
        videoStrip: results['videoStrip'] ?? {},
        titleMainImages: results['titleMainImages'] ?? {},
        productionStatus: results['productionStatus'],
        primaryImage: results['primaryImage'],
        imageUploadLink: results['imageUploadLink'] ?? {},
        canHaveEpisodes: results['canHaveEpisodes'] ?? false,
        cast: cast,
        directors: directors,
        writers: writers,
        principalCast: results['principalCast'] ?? {},
        creators: results['creators'] ?? [],
        isAdult: results['isAdult'] ?? false,
        moreLikeThisTitles: results['moreLikeThisTitles'] ?? {},
        summaries: results['summaries'] ?? {},
        outlines: results['outlines'] ?? {},
        synopses: results['synopses'] ?? {},
        storylineKeywords: results['storylineKeywords'] ?? {},
        taglines: results['taglines'] ?? {},
        genres: results['genres'] ?? {},
        certificate: results['certificate'],
        parentsGuide: results['parentsGuide'] ?? {},
        triviaTotal: results['triviaTotal'] ?? {},
        trivia: results['trivia'] ?? {},
        goofsTotal: results['goofsTotal'] ?? {},
        goofs: results['goofs'] ?? {},
        quotesTotal: results['quotesTotal'] ?? {},
        quotes: results['quotes'] ?? {},
        crazyCredits: results['crazyCredits'] ?? {},
        alternateVersions: results['alternateVersions'] ?? {},
        connections: results['connections'] ?? {},
        soundtrack: results['soundtrack'] ?? {},
        reviews: results['reviews'] ?? {},
        featuredReviews: results['featuredReviews'] ?? {},
        canRate: results['canRate'] ?? {},
        iframeAddReviewLink: results['iframeAddReviewLink'] ?? {},
        faqsTotal: results['faqsTotal'] ?? {},
        faqs: results['faqs'] ?? {},
        releaseDate: results['releaseDate'],
        countriesOfOrigin: results['countriesOfOrigin'] ?? {},
        detailsExternalLinks: results['detailsExternalLinks'] ?? {},
        spokenLanguages: results['spokenLanguages'] ?? {},
        akas: results['akas'] ?? {},
        filmingLocations: results['filmingLocations'] ?? {},
        production: results['production'] ?? {},
        productionBudget: results['productionBudget'],
        lifetimeGross: results['lifetimeGross'],
        openingWeekendGross: results['openingWeekendGross'],
        worldwideGross: results['worldwideGross'],
        technicalSpecifications: results['technicalSpecifications'] ?? {},
        runtime: results['runtime'],
        series: results['series'],
        news: results['news'] ?? {},
        contributionQuestions: results['contributionQuestions'] ?? {},
        meterRanking: results['meterRanking'],
        images: results['images'] ?? {},
        primaryVideos: results['primaryVideos'] ?? {},
        externalLinks: results['externalLinks'] ?? {},
        metacritic: results['metacritic'],
        keywords: results['keywords'] ?? {},
        plot: results['plot'],
        plotContributionLink: results['plotContributionLink'] ?? {},
        credits: results['credits'] ?? {},
        principalCredits: results['principalCredits'] ?? [],
        criticReviewsTotal: results['criticReviewsTotal'] ?? {},
        meta: results['meta'] ?? {},
        castPageTitle: results['castPageTitle'] ?? {},
        creatorsPageTitle: results['creatorsPageTitle'] ?? {},
        directorsPageTitle: results['directorsPageTitle'] ?? {},
      );
    } else {
      return Title(
        pageNumber: pageNumber ?? 1,
        id: json['id'],
        primaryImageURL: json['primaryImage']?['url'],
        titleType: json['titleType']['text'],
        titleText: json['titleText']['text'],
        originalTitleText: json['originalTitleText']['text'],
        releaseYear: json['releaseYear']['year'],
        releaseDateDay: json['releaseDate']?['day'],
        releaseDateMonth: json['releaseDate']?['month'],
        releaseDateYear: json['releaseYear']?['year'],
        wins: json['wins'] ?? {},
        nominations: json['nominations'] ?? {},
        prestigiousAwardSummary: json['prestigiousAwardSummary'],
        ratingsSummary: json['ratingsSummary'] ?? {},
        episodes: json['episodes'],
        videos: json['videos'] ?? {},
        videoStrip: json['videoStrip'] ?? {},
        titleMainImages: json['titleMainImages'] ?? {},
        productionStatus: json['productionStatus'],
        primaryImage: json['primaryImage'],
        imageUploadLink: json['imageUploadLink'] ?? {},
        canHaveEpisodes: json['canHaveEpisodes'] ?? false,
        cast: cast,
        principalCast: json['principalCast'] ?? {},
        creators: json['creators'] ?? [],
        directors: directors,
        writers: writers,
        isAdult: json['isAdult'] ?? false,
        moreLikeThisTitles: json['moreLikeThisTitles'] ?? {},
        summaries: json['summaries'] ?? {},
        outlines: json['outlines'] ?? {},
        synopses: json['synopses'] ?? {},
        storylineKeywords: json['storylineKeywords'] ?? {},
        taglines: json['taglines'] ?? {},
        genres: json['genres'] ?? {},
        certificate: json['certificate'],
        parentsGuide: json['parentsGuide'] ?? {},
        triviaTotal: json['triviaTotal'] ?? {},
        trivia: json['trivia'] ?? {},
        goofsTotal: json['goofsTotal'] ?? {},
        goofs: json['goofs'] ?? {},
        quotesTotal: json['quotesTotal'] ?? {},
        quotes: json['quotes'] ?? {},
        crazyCredits: json['crazyCredits'] ?? {},
        alternateVersions: json['alternateVersions'] ?? {},
        connections: json['connections'] ?? {},
        soundtrack: json['soundtrack'] ?? {},
        reviews: json['reviews'] ?? {},
        featuredReviews: json['featuredReviews'] ?? {},
        canRate: json['canRate'] ?? {},
        iframeAddReviewLink: json['iframeAddReviewLink'] ?? {},
        faqsTotal: json['faqsTotal'] ?? {},
        faqs: json['faqs'] ?? {},
        releaseDate: json['releaseDate'],
        countriesOfOrigin: json['countriesOfOrigin'] ?? {},
        detailsExternalLinks: json['detailsExternalLinks'] ?? {},
        spokenLanguages: json['spokenLanguages'] ?? {},
        akas: json['akas'] ?? {},
        filmingLocations: json['filmingLocations'] ?? {},
        production: json['production'] ?? {},
        productionBudget: json['productionBudget'],
        lifetimeGross: json['lifetimeGross'],
        openingWeekendGross: json['openingWeekendGross'],
        worldwideGross: json['worldwideGross'],
        technicalSpecifications: json['technicalSpecifications'] ?? {},
        runtime: json['runtime'],
        series: json['series'],
        news: json['news'] ?? {},
        contributionQuestions: json['contributionQuestions'] ?? {},
        meterRanking: json['meterRanking'],
        images: json['images'] ?? {},
        primaryVideos: json['primaryVideos'] ?? {},
        externalLinks: json['externalLinks'] ?? {},
        metacritic: json['metacritic'],
        keywords: json['keywords'] ?? {},
        plot: json['plot'],
        plotContributionLink: json['plotContributionLink'] ?? {},
        credits: json['credits'] ?? {},
        principalCredits: json['principalCredits'] ?? [],
        criticReviewsTotal: json['criticReviewsTotal'] ?? {},
        meta: json['meta'] ?? {},
        castPageTitle: json['castPageTitle'] ?? {},
        creatorsPageTitle: json['creatorsPageTitle'] ?? {},
        directorsPageTitle: json['directorsPageTitle'] ?? {},
      );
    }
  }
}
