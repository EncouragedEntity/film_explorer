class Title {
  final String id;
  int pageNumber;
  final String? primaryImageURL;
  final String titleType;
  final String titleText;
  final String originalTitleText;
  final int releaseYear;
  final int? releaseDateDay;
  final int? releaseDateMonth;
  final int? releaseDateYear;
  final Map<String, dynamic> wins;
  final Map<String, dynamic> nominations;
  final dynamic prestigiousAwardSummary;
  final Map<String, dynamic> ratingsSummary;
  final dynamic episodes;
  final Map<String, dynamic> videos;
  final Map<String, dynamic> videoStrip;
  final Map<String, dynamic> titleMainImages;
  final dynamic productionStatus;
  final dynamic primaryImage;
  final Map<String, dynamic> imageUploadLink;
  final bool canHaveEpisodes;
  final Map<String, dynamic> cast;
  final List<dynamic> principalCast;
  final List<dynamic> creators;
  final List<dynamic> directors;
  final List<dynamic> writers;
  final bool isAdult;
  final Map<String, dynamic> moreLikeThisTitles;
  final Map<String, dynamic> summaries;
  final Map<String, dynamic> outlines;
  final Map<String, dynamic> synopses;
  final Map<String, dynamic> storylineKeywords;
  final Map<String, dynamic> taglines;
  final Map<String, dynamic> genres;
  final dynamic certificate;
  final Map<String, dynamic> parentsGuide;
  final Map<String, dynamic> triviaTotal;
  final Map<String, dynamic> trivia;
  final Map<String, dynamic> goofsTotal;
  final Map<String, dynamic> goofs;
  final Map<String, dynamic> quotesTotal;
  final Map<String, dynamic> quotes;
  final Map<String, dynamic> crazyCredits;
  final Map<String, dynamic> alternateVersions;
  final Map<String, dynamic> connections;
  final Map<String, dynamic> soundtrack;
  final Map<String, dynamic> reviews;
  final Map<String, dynamic> featuredReviews;
  final Map<String, dynamic> canRate;
  final Map<String, dynamic> iframeAddReviewLink;
  final Map<String, dynamic> faqsTotal;
  final Map<String, dynamic> faqs;
  final dynamic releaseDate;
  final Map<String, dynamic> countriesOfOrigin;
  final Map<String, dynamic> detailsExternalLinks;
  final Map<String, dynamic> spokenLanguages;
  final Map<String, dynamic> akas;
  final Map<String, dynamic> filmingLocations;
  final Map<String, dynamic> production;
  final dynamic productionBudget;
  final dynamic lifetimeGross;
  final dynamic openingWeekendGross;
  final dynamic worldwideGross;
  final Map<String, dynamic> technicalSpecifications;
  final dynamic runtime;
  final dynamic series;
  final Map<String, dynamic> news;
  final Map<String, dynamic> contributionQuestions;
  final dynamic meterRanking;
  final Map<String, dynamic> images;
  final Map<String, dynamic> primaryVideos;
  final Map<String, dynamic> externalLinks;
  final dynamic metacritic;
  final Map<String, dynamic> keywords;
  final dynamic plot;
  final Map<String, dynamic> plotContributionLink;
  final Map<String, dynamic> credits;
  final List<dynamic> principalCredits;
  final Map<String, dynamic> criticReviewsTotal;
  final Map<String, dynamic> meta;
  final Map<String, dynamic> castPageTitle;
  final Map<String, dynamic> creatorsPageTitle;
  final Map<String, dynamic> directorsPageTitle;

  Title({
    required this.pageNumber,
    required this.id,
    required this.primaryImageURL,
    required this.titleType,
    required this.titleText,
    required this.originalTitleText,
    required this.releaseYear,
    this.releaseDateDay,
    this.releaseDateMonth,
    this.releaseDateYear,
    required this.wins,
    required this.nominations,
    required this.prestigiousAwardSummary,
    required this.ratingsSummary,
    required this.episodes,
    required this.videos,
    required this.videoStrip,
    required this.titleMainImages,
    required this.productionStatus,
    required this.primaryImage,
    required this.imageUploadLink,
    required this.canHaveEpisodes,
    required this.cast,
    required this.principalCast,
    required this.creators,
    required this.directors,
    required this.writers,
    required this.isAdult,
    required this.moreLikeThisTitles,
    required this.summaries,
    required this.outlines,
    required this.synopses,
    required this.storylineKeywords,
    required this.taglines,
    required this.genres,
    required this.certificate,
    required this.parentsGuide,
    required this.triviaTotal,
    required this.trivia,
    required this.goofsTotal,
    required this.goofs,
    required this.quotesTotal,
    required this.quotes,
    required this.crazyCredits,
    required this.alternateVersions,
    required this.connections,
    required this.soundtrack,
    required this.reviews,
    required this.featuredReviews,
    required this.canRate,
    required this.iframeAddReviewLink,
    required this.faqsTotal,
    required this.faqs,
    required this.releaseDate,
    required this.countriesOfOrigin,
    required this.detailsExternalLinks,
    required this.spokenLanguages,
    required this.akas,
    required this.filmingLocations,
    required this.production,
    required this.productionBudget,
    required this.lifetimeGross,
    required this.openingWeekendGross,
    required this.worldwideGross,
    required this.technicalSpecifications,
    required this.runtime,
    required this.series,
    required this.news,
    required this.contributionQuestions,
    required this.meterRanking,
    required this.images,
    required this.primaryVideos,
    required this.externalLinks,
    required this.metacritic,
    required this.keywords,
    required this.plot,
    required this.plotContributionLink,
    required this.credits,
    required this.principalCredits,
    required this.criticReviewsTotal,
    required this.meta,
    required this.castPageTitle,
    required this.creatorsPageTitle,
    required this.directorsPageTitle,
  });

  factory Title.fromJson(Map<String, dynamic> json, {int? pageNumber}) {
    final results = json['results'] as Map<String, dynamic>?;

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
        cast: results['cast'] ?? {},
        principalCast: results['principalCast'] ?? [],
        creators: results['creators'] ?? [],
        directors: results['directors'] ?? [],
        writers: results['writers'] ?? [],
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
        cast: json['cast'] ?? {},
        principalCast: json['principalCast'] ?? [],
        creators: json['creators'] ?? [],
        directors: json['directors'] ?? [],
        writers: json['writers'] ?? [],
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
