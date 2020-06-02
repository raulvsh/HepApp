import 'package:flutter/material.dart';
/* Las flechas están numeradas de izquierda a derecha y de arriba a abajo.
 * arrow00: Flecha vertical que va de "1 (<=2cm)" a "A"
 * arrow36: Flecha horizontal que va de "TARE" a "LT"
 * Cambiando desde aquí los datos no se redibuja el widget, si se añade una
 * nueva línea probarla en alberta_diagram_painter con la variable points y
 * crear aquí nueva variable arrowXX.
 */

final List<Offset> arrow00 = [
  Offset(130, 44),
  Offset(130, 57),
  Offset(127, 54),
  Offset(130, 57),
  Offset(133, 54),
];
final List<Offset> arrow01 = [
  Offset(190, 44),
  Offset(190, 70),
  Offset(142, 70),
  Offset(145, 73),
  Offset(142, 70),
  Offset(145, 67),
];
final List<Offset> arrow02 = [
  Offset(212, 44),
  Offset(212, 57),
  Offset(209, 54),
  Offset(212, 57),
  Offset(215, 54),
];
final List<Offset> arrow03 = [
  Offset(248, 44),
  Offset(248, 57),
  Offset(245, 54),
  Offset(248, 57),
  Offset(251, 54),
];
final List<Offset> arrow04 = [
  Offset(307, 44),
  Offset(307, 57),
  Offset(304, 54),
  Offset(307, 57),
  Offset(310, 54),
];
final List<Offset> arrow05 = [
  Offset(352, 44),
  Offset(352, 57),
  Offset(349, 54),
  Offset(352, 57),
  Offset(355, 54),
];
final List<Offset> arrow06 = [
  Offset(410, 44),
  Offset(410, 57),
  Offset(407, 54),
  Offset(410, 57),
  Offset(413, 54),
];
final List<Offset> arrow07 = [
  Offset(445, 44),
  Offset(445, 57),
  Offset(442, 54),
  Offset(445, 57),
  Offset(448, 54),
];
final List<Offset> arrow08 = [
  Offset(500, 17),
  Offset(500, 226),
  Offset(497, 223),
  Offset(500, 226),
  Offset(503, 223),
];
final List<Offset> arrow09 = [
  Offset(457, 70),
  Offset(500, 70),
  Offset(497, 67),
  Offset(500, 70),
  Offset(497, 73),
];
final List<Offset> arrow10 = [
  Offset(130, 82),
  Offset(130, 91),
  Offset(127, 88),
  Offset(130, 91),
  Offset(133, 88),
];
final List<Offset> arrow11 = [
  Offset(212, 82),
  Offset(212, 91),
  Offset(209, 88),
  Offset(212, 91),
  Offset(215, 88),
];
final List<Offset> arrow12 = [
  Offset(248, 82),
  Offset(248, 91),
  Offset(245, 88),
  Offset(248, 91),
  Offset(251, 88),
];
final List<Offset> arrow13 = [
  Offset(307, 82),
  Offset(307, 105),
  Offset(275, 105),
  Offset(278, 102),
  Offset(275, 105),
  Offset(278, 108),
];
final List<Offset> arrow14 = [
  Offset(352, 82),
  Offset(352, 92),
  Offset(349, 89),
  Offset(352, 92),
  Offset(355, 89),
];
final List<Offset> arrow15 = [
  Offset(410, 82),
  Offset(410, 92),
  Offset(407, 89),
  Offset(410, 92),
  Offset(413, 89),
];
final List<Offset> arrow16 = [
  Offset(113, 118),
  Offset(113, 147),
  Offset(110, 144),
  Offset(113, 147),
  Offset(116, 144),
];
final List<Offset> arrow17 = [
  Offset(157, 118),
  Offset(157, 147),
  Offset(154, 144),
  Offset(157, 147),
  Offset(160, 144),
];
final List<Offset> arrow18 = [
  Offset(170, 160),
  Offset(175, 160),
  Offset(175, 105),
  Offset(185, 105),
  Offset(182, 102),
  Offset(185, 105),
  Offset(182, 108),
];
final List<Offset> arrow19 = [
  Offset(202, 118),
  Offset(202, 147),
  Offset(199, 144),
  Offset(202, 147),
  Offset(205, 144),
];
final List<Offset> arrow20 = [
  Offset(230, 118),
  Offset(230, 147),
  Offset(227, 144),
  Offset(230, 147),
  Offset(233, 144),
];
final List<Offset> arrow21 = [
  Offset(260, 118),
  Offset(260, 160),
  Offset(278, 160),
  Offset(275, 157),
  Offset(278, 160),
  Offset(275, 163),
];
final List<Offset> arrow22 = [
  Offset(336, 110),
  Offset(336, 122),
  Offset(333, 119),
  Offset(336, 122),
  Offset(339, 119),
];
final List<Offset> arrow23 = [
  Offset(385, 110),
  Offset(385, 122),
  Offset(382, 119),
  Offset(385, 122),
  Offset(388, 119),
];

final List<Offset> arrow24 = [
  Offset(410, 110),
  Offset(410, 172),
  Offset(407, 169),
  Offset(410, 172),
  Offset(413, 169),
];

final List<Offset> arrow24b = [
  Offset(440, 110),
  Offset(440, 172),
  Offset(437, 169),
  Offset(440, 172),
  Offset(443, 169),
];

final List<Offset> arrow25 = [
  Offset(399, 135),
  Offset(500, 135),
  Offset(497, 132),
  Offset(500, 135),
  Offset(497, 138),
];
final List<Offset> arrow26 = [
  Offset(302, 160),
  Offset(500, 160),
  Offset(497, 157),
  Offset(500, 160),
  Offset(497, 163),
];
final List<Offset> arrow27 = [
  Offset(336, 147),
  Offset(336, 176),
  Offset(333, 173),
  Offset(336, 176),
  Offset(339, 173),
];
final List<Offset> arrow28 = [
  Offset(113, 172),
  Offset(113, 226),
  Offset(110, 223),
  Offset(113, 226),
  Offset(116, 223),
];
final List<Offset> arrow29 = [
  Offset(202, 172),
  Offset(202, 226),
  Offset(199, 223),
  Offset(202, 226),
  Offset(205, 223),
];
final List<Offset> arrow30 = [
  Offset(233, 172),
  Offset(233, 226),
  Offset(230, 223),
  Offset(233, 226),
  Offset(236, 223),
];
final List<Offset> arrow31 = [
  Offset(315, 193),
  Offset(315, 197),
  Offset(313, 195),
  Offset(315, 197),
  Offset(317, 195),
];
final List<Offset> arrow32 = [
  Offset(360, 193),
  Offset(360, 197),
  Offset(358, 195),
  Offset(360, 197),
  Offset(363, 195),
];
final List<Offset> arrow33 = [
  Offset(410, 197),
  Offset(410, 226),
  Offset(407, 223),
  Offset(410, 226),
  Offset(413, 223),
];
final List<Offset> arrow33b = [
  Offset(440, 197),
  Offset(440, 226),
  Offset(437, 223),
  Offset(440, 226),
  Offset(443, 223),
];
final List<Offset> arrow34 = [
  Offset(316, 222),
  Offset(316, 226),
  Offset(314, 224),
  Offset(316, 226),
  Offset(318, 224),
];
final List<Offset> arrow35 = [
  Offset(361, 222),
  Offset(361, 226),
  Offset(359, 224),
  Offset(361, 226),
  Offset(363, 224),
];
final List<Offset> arrow36 = [
  Offset(285, 235),
  Offset(256, 235),
  Offset(259, 232),
  Offset(256, 235),
  Offset(259, 238),
];
