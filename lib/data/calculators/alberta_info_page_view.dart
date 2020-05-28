import 'package:hepapp/data/calculators/best_supportive_care.dart';
import 'package:hepapp/data/calculators/lt.dart';
import 'package:hepapp/data/calculators/ramucirumab.dart';
import 'package:hepapp/data/calculators/regorafenib.dart';
import 'package:hepapp/data/calculators/resection.dart';
import 'package:hepapp/data/calculators/sorafenib.dart';

import 'file:///D:/GitHub/HepApp/lib/data/calculators/rfa.dart';
import 'file:///D:/GitHub/HepApp/lib/data/calculators/sbrt.dart';
import 'file:///D:/GitHub/HepApp/lib/data/calculators/tace.dart';
import 'file:///D:/GitHub/HepApp/lib/data/calculators/tare.dart';

import 'cabozantinib.dart';
import 'lenvatinib.dart';

/*||título | [subtitulo1, subritulo2] | contenido | ruta ||*/
final albertaInfoPageView = [
  [
    'very_early_stage_resection',
    'very_early_stage_hepatocellular_carcinoma',
    'definitions_goals_recommendations',
    resection,
    '/AlbertaInfoPage',
  ],
  [
    'early_stage_lt',
    'early_stage_hepatocellular_carcinoma',
    'definitions_goals_recommendations',
    lt,
    '/AlbertaInfoPage',
  ],
  [
    'early_stage_rfa',
    'early_stage_hepatocellular_carcinoma',
    'definitions_goals_recommendations',
    rfa,
    '/AlbertaInfoPage',
  ],
  [
    'intermediate_stage_tace',
    'intermediate_stage_hepatocellular_carcinoma',
    'definitions_goals_recommendations',
    tace,
    '/AlbertaInfoPage',
  ],
  [
    'intermediate_stage_tare',
    'intermediate_stage_hepatocellular_carcinoma',
    'definitions_goals_recommendations',
    tare,
    '/AlbertaInfoPage',
  ],
  [
    'advanced_stage_sorafenib',
    'advanced_stage_hepatocellular_carcinoma',
    'definitions_goals_recommendations',
    sorafenib,
    '/AlbertaInfoPage',
  ],
  [
    'advanced_stage_lenvatinib',
    'advanced_stage_hepatocellular_carcinoma',
    'definitions_goals_recommendations',
    lenvatinib,
    '/AlbertaInfoPage',
  ],
  [
    'advanced_stage_regorafenib',
    'advanced_stage_hepatocellular_carcinoma',
    'definitions_goals_recommendations',
    regorafenib,
    '/AlbertaInfoPage',
  ],
  [
    'advanced_stage_cabozantinib',
    'advanced_stage_hepatocellular_carcinoma',
    'definitions_goals_recommendations',
    cabozantinib,
    '/AlbertaInfoPage',
  ],
  [
    'advanced_stage_ramucirumab',
    'advanced_stage_hepatocellular_carcinoma',
    'definitions_goals_recommendations',
    ramucirumab,
    '/AlbertaInfoPage',
  ],
  [
    'advanced_stage_sbrt',
    'advanced_stage_hepatocellular_carcinoma',
    'definitions_goals_recommendations',
    sbrt,
    '/AlbertaInfoPage',
  ],
  [
    'terminal_stage_best_supportive_care',
    'terminal_stage_hepatocellular_carcinoma',
    'definitions_goals_recommendations',
    bestSupportiveCare,
    '/AlbertaInfoPage',
  ],
];
