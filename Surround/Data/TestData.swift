//
//  TestData.swift
//  Surround
//
//  Created by Anh Khoa Hong on 5/21/20.
//

import Foundation

class TestData {
    static var Scored19x19Korean: Game { sampleGame(id: 0) }
    static var Resigned19x19HandicappedWithInitialState: Game {
        let game = sampleGame(id: 1)
        game.ogsRawData = [
            "players": [
                "black": [
                    "icon": "https://secure.gravatar.com/avatar/7e8d12fdf00911f6b573b6644b518f4d?s=32&d=retro"
                ],
                "white": [
                    "icon": "https://b0c2ddc39d13e1c0ddad-93a52a5bc9e7cc06050c1a999beb3694.ssl.cf1.rackcdn.com/bb1794c4b0538ce0068287464079d02e-32.png"
                ]
            ]
        ]
        return game
    }
    static var Resigned9x9Japanese: Game { sampleGame(id: 2) }
    static var Ongoing19x19HandicappedWithNoInitialState: Game {
        let game = sampleGame(id: 3)
        game.ogsRawData = [
            "players": [
                "black": [
                    "icon": "https://secure.gravatar.com/avatar/7e8d12fdf00911f6b573b6644b518f4d?s=32&d=retro"
                ],
                "white": [
                    "icon": "https://b0c2ddc39d13e1c0ddad-93a52a5bc9e7cc06050c1a999beb3694.ssl.cf1.rackcdn.com/bb1794c4b0538ce0068287464079d02e-32.png"
                ]
            ]
        ]
        return game
    }
    static var Scored15x17: Game { sampleGame(id: 4) }

    static func sampleGame(id: Int = 0) -> Game {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let ogsGame = try! decoder.decode(OGSGame.self, from: testData[id][0].data(using: .utf8)!)
        return Game(ogsGame: ogsGame)
    }
    
    static let testData : [[String]] = [
        // MARK: - W+ Scored, 19x19, Korean
        // MARK: - #18759438
        ["""
        {
            "white_player_id": 314459,
            "black_player_id": 356,
            "game_id": 18759438,
            "game_name": "Tournament Game: 1st 3 Kyu to 3 Dan Tournament (50283) R:1 (HongAnhKhoa vs Dyonn)",
            "private": false,
            "pause_on_weekends": true,
            "players": {
                "black": {
                    "username": "Dyonn",
                    "rank": 28.105412404704705,
                    "professional": false,
                    "egf": 1633.77,
                    "id": 356,
                    "accepted_stones": "qapbqbhdheiehfifjfjghhihjhkheigiiijiejgjijikjkkkjlqlbmjmjnlnqnfpcqbrdrer"
                },
                "white": {
                    "username": "HongAnhKhoa",
                    "rank": 28.513949148811413,
                    "professional": false,
                    "egf": 1720.594,
                    "id": 314459,
                    "accepted_stones": "qapbqbhdheiehfifjfjghhihjhkheigiiijiejgjijikjkkkjlqlbmjmjnlnqnfpcqbrdrer"
                }
            },
            "ranked": true,
            "disable_analysis": false,
            "handicap": 0,
            "komi": 6.5,
            "width": 19,
            "height": 19,
            "rules": "korean",
            "tournament_id": 50283,
            "tournament_round": 1,
            "time_control": {
                "system": "fischer",
                "time_control": "fischer",
                "speed": "correspondence",
                "pause_on_weekends": true,
                "time_increment": 86400,
                "initial_time": 259200,
                "max_time": 604800
            },
            "phase": "finished",
            "history": [],
            "initial_player": "black",
            "moves": [
                [
                    15,
                    3,
                    3854269
                ],
                [
                    15,
                    15,
                    67690194
                ],
                [
                    2,
                    3,
                    10271123
                ],
                [
                    3,
                    15,
                    34166712
                ],
                [
                    4,
                    2,
                    37247392
                ],
                [
                    3,
                    9,
                    83919093
                ],
                [
                    16,
                    9,
                    507423
                ],
                [
                    16,
                    2,
                    77624823
                ],
                [
                    16,
                    3,
                    2124217
                ],
                [
                    15,
                    2,
                    1682264
                ],
                [
                    14,
                    2,
                    1885902
                ],
                [
                    14,
                    1,
                    57159498
                ],
                [
                    13,
                    1,
                    28954647
                ],
                [
                    13,
                    2,
                    1728282
                ],
                [
                    14,
                    3,
                    88225
                ],
                [
                    12,
                    1,
                    1470747
                ],
                [
                    15,
                    1,
                    781206
                ],
                [
                    13,
                    0,
                    51615577
                ],
                [
                    16,
                    1,
                    25803584
                ],
                [
                    9,
                    2,
                    5109310
                ],
                [
                    9,
                    15,
                    11532608
                ],
                [
                    5,
                    16,
                    42655700
                ],
                [
                    13,
                    16,
                    27662643
                ],
                [
                    16,
                    13,
                    4063045
                ],
                [
                    16,
                    16,
                    7123701
                ],
                [
                    15,
                    16,
                    62151648
                ],
                [
                    15,
                    17,
                    8646848
                ],
                [
                    14,
                    17,
                    229165664
                ],
                [
                    16,
                    17,
                    34210672
                ],
                [
                    13,
                    17,
                    155071632
                ],
                [
                    12,
                    16,
                    13490502
                ],
                [
                    12,
                    17,
                    167488
                ],
                [
                    11,
                    16,
                    65607
                ],
                [
                    14,
                    16,
                    49989
                ],
                [
                    17,
                    14,
                    50503
                ],
                [
                    12,
                    14,
                    3561269
                ],
                [
                    11,
                    17,
                    1534181
                ],
                [
                    15,
                    8,
                    83023
                ],
                [
                    16,
                    8,
                    52823
                ],
                [
                    15,
                    6,
                    8609464
                ],
                [
                    16,
                    7,
                    278324
                ],
                [
                    15,
                    7,
                    163803
                ],
                [
                    16,
                    6,
                    43805
                ],
                [
                    8,
                    17,
                    160311610
                ],
                [
                    11,
                    13,
                    2142439
                ],
                [
                    11,
                    14,
                    15691916
                ],
                [
                    10,
                    14,
                    177816
                ],
                [
                    10,
                    13,
                    132615016
                ],
                [
                    9,
                    13,
                    24059874
                ],
                [
                    10,
                    12,
                    2632889
                ],
                [
                    9,
                    12,
                    1558832
                ],
                [
                    10,
                    11,
                    56017531
                ],
                [
                    9,
                    11,
                    26045116
                ],
                [
                    12,
                    12,
                    7257589
                ],
                [
                    10,
                    10,
                    75842
                ],
                [
                    10,
                    15,
                    56240063
                ],
                [
                    9,
                    16,
                    24196305
                ],
                [
                    9,
                    14,
                    1417623
                ],
                [
                    8,
                    14,
                    43556
                ],
                [
                    10,
                    14,
                    147911085
                ],
                [
                    7,
                    15,
                    22457533
                ],
                [
                    10,
                    16,
                    165073404
                ],
                [
                    9,
                    17,
                    8718200
                ],
                [
                    8,
                    13,
                    438596095
                ],
                [
                    7,
                    13,
                    2863215
                ],
                [
                    8,
                    12,
                    74889014
                ],
                [
                    9,
                    10,
                    3983288
                ],
                [
                    7,
                    11,
                    49579921
                ],
                [
                    7,
                    12,
                    30016524
                ],
                [
                    8,
                    11,
                    833814805
                ],
                [
                    6,
                    11,
                    33711425
                ],
                [
                    7,
                    10,
                    159969766
                ],
                [
                    5,
                    12,
                    14302040
                ],
                [
                    7,
                    8,
                    1157106
                ],
                [
                    15,
                    9,
                    58458
                ],
                [
                    14,
                    9,
                    299474528
                ],
                [
                    14,
                    10,
                    41431633
                ],
                [
                    13,
                    10,
                    387815136
                ],
                [
                    14,
                    8,
                    194404
                ],
                [
                    13,
                    9,
                    56543551
                ],
                [
                    15,
                    5,
                    5967797
                ],
                [
                    13,
                    7,
                    49065350
                ],
                [
                    12,
                    8,
                    20989100
                ],
                [
                    13,
                    8,
                    53947837
                ],
                [
                    9,
                    7,
                    33450460
                ],
                [
                    7,
                    6,
                    768403371
                ],
                [
                    11,
                    5,
                    5868690
                ],
                [
                    10,
                    6,
                    247786562
                ],
                [
                    9,
                    6,
                    30743178
                ],
                [
                    10,
                    5,
                    392332283
                ],
                [
                    9,
                    5,
                    20949488
                ],
                [
                    10,
                    4,
                    12554525
                ],
                [
                    7,
                    5,
                    342007
                ],
                [
                    6,
                    5,
                    84205169
                ],
                [
                    7,
                    4,
                    1152871
                ],
                [
                    6,
                    4,
                    367118
                ],
                [
                    7,
                    3,
                    464004
                ],
                [
                    6,
                    3,
                    54302976
                ],
                [
                    6,
                    2,
                    21660906
                ],
                [
                    6,
                    6,
                    133684701
                ],
                [
                    6,
                    9,
                    38121893
                ],
                [
                    7,
                    9,
                    54598105
                ],
                [
                    10,
                    7,
                    32971836
                ],
                [
                    6,
                    14,
                    63085416
                ],
                [
                    7,
                    14,
                    23212837
                ],
                [
                    2,
                    6,
                    163923176
                ],
                [
                    2,
                    11,
                    5451251
                ],
                [
                    2,
                    14,
                    89068191
                ],
                [
                    1,
                    9,
                    84665009
                ],
                [
                    3,
                    11,
                    258984933
                ],
                [
                    3,
                    12,
                    13232788
                ],
                [
                    2,
                    12,
                    211247718
                ],
                [
                    4,
                    11,
                    35462079
                ],
                [
                    3,
                    10,
                    2415961
                ],
                [
                    1,
                    12,
                    31675
                ],
                [
                    2,
                    13,
                    59880565
                ],
                [
                    1,
                    7,
                    28834935
                ],
                [
                    2,
                    10,
                    751240568
                ],
                [
                    1,
                    6,
                    18655522
                ],
                [
                    1,
                    10,
                    420898512
                ],
                [
                    6,
                    8,
                    16407737
                ],
                [
                    4,
                    7,
                    54013964
                ],
                [
                    4,
                    8,
                    31080775
                ],
                [
                    3,
                    8,
                    64259098
                ],
                [
                    7,
                    7,
                    23259919
                ],
                [
                    6,
                    7,
                    65135123
                ],
                [
                    8,
                    7,
                    19424512
                ],
                [
                    6,
                    10,
                    5389114
                ],
                [
                    4,
                    9,
                    103816
                ],
                [
                    4,
                    10,
                    4493047
                ],
                [
                    5,
                    15,
                    8874440
                ],
                [
                    6,
                    16,
                    764861479
                ],
                [
                    7,
                    17,
                    1154896
                ],
                [
                    7,
                    16,
                    43819971
                ],
                [
                    8,
                    16,
                    39350406
                ],
                [
                    6,
                    17,
                    148499025
                ],
                [
                    8,
                    18,
                    28818144
                ],
                [
                    6,
                    15,
                    142683932
                ],
                [
                    10,
                    17,
                    28531976
                ],
                [
                    9,
                    4,
                    84767232
                ],
                [
                    8,
                    4,
                    1353949
                ],
                [
                    2,
                    5,
                    83656410
                ],
                [
                    1,
                    4,
                    848126
                ],
                [
                    11,
                    7,
                    223149674
                ],
                [
                    14,
                    11,
                    39629567
                ],
                [
                    16,
                    11,
                    81834186
                ],
                [
                    15,
                    10,
                    4202459
                ],
                [
                    16,
                    15,
                    127350396
                ],
                [
                    17,
                    15,
                    39153837
                ],
                [
                    11,
                    8,
                    162113155
                ],
                [
                    14,
                    13,
                    11756210
                ],
                [
                    14,
                    14,
                    171507798
                ],
                [
                    13,
                    13,
                    3475204
                ],
                [
                    13,
                    14,
                    132480232
                ],
                [
                    16,
                    14,
                    82554
                ],
                [
                    10,
                    8,
                    634271
                ],
                [
                    9,
                    8,
                    263606
                ],
                [
                    9,
                    9,
                    81259481
                ],
                [
                    8,
                    9,
                    45047526
                ],
                [
                    10,
                    9,
                    84064319
                ],
                [
                    8,
                    8,
                    679427
                ],
                [
                    11,
                    10,
                    435253525
                ],
                [
                    8,
                    10,
                    2041202
                ],
                [
                    5,
                    10,
                    256409755
                ],
                [
                    8,
                    5,
                    7
                ],
                [
                    7,
                    2,
                    136778466
                ],
                [
                    8,
                    2,
                    7
                ],
                [
                    7,
                    1,
                    75257542
                ],
                [
                    8,
                    1,
                    6
                ],
                [
                    6,
                    1,
                    49551133
                ],
                [
                    11,
                    6,
                    524317
                ],
                [
                    9,
                    3,
                    70778577
                ],
                [
                    12,
                    7,
                    13980515
                ],
                [
                    11,
                    9,
                    45456654
                ],
                [
                    13,
                    6,
                    38453188
                ],
                [
                    12,
                    13,
                    78670374
                ],
                [
                    13,
                    11,
                    8142367
                ],
                [
                    12,
                    11,
                    59680395
                ],
                [
                    2,
                    16,
                    24370225
                ],
                [
                    3,
                    16,
                    730493297
                ],
                [
                    3,
                    17,
                    46134397
                ],
                [
                    1,
                    16,
                    174237640
                ],
                [
                    1,
                    17,
                    1659943
                ],
                [
                    1,
                    15,
                    5350172
                ],
                [
                    4,
                    17,
                    270515
                ],
                [
                    6,
                    18,
                    34655507
                ],
                [
                    7,
                    18,
                    41997270
                ],
                [
                    5,
                    13,
                    767095478
                ],
                [
                    4,
                    13,
                    12215596
                ],
                [
                    4,
                    14,
                    43887426
                ],
                [
                    4,
                    5,
                    40955710
                ],
                [
                    3,
                    4,
                    233960375
                ],
                [
                    5,
                    2,
                    30131762
                ],
                [
                    4,
                    4,
                    51132617
                ],
                [
                    5,
                    1,
                    32462259
                ],
                [
                    8,
                    3,
                    8349130
                ],
                [
                    11,
                    4,
                    591063
                ],
                [
                    9,
                    1,
                    305869137
                ],
                [
                    2,
                    7,
                    31481187
                ],
                [
                    3,
                    7,
                    49316341
                ],
                [
                    11,
                    2,
                    34948688
                ],
                [
                    11,
                    1,
                    75812451
                ],
                [
                    13,
                    3,
                    13247482
                ],
                [
                    12,
                    2,
                    597046337
                ],
                [
                    6,
                    12,
                    6961070
                ],
                [
                    14,
                    6,
                    169859087
                ],
                [
                    14,
                    5,
                    8960705
                ],
                [
                    14,
                    7,
                    151756198
                ],
                [
                    0,
                    10,
                    17029904
                ],
                [
                    0,
                    11,
                    42555052
                ],
                [
                    0,
                    9,
                    42090603
                ],
                [
                    1,
                    11,
                    77483946
                ],
                [
                    15,
                    14,
                    7489070
                ],
                [
                    12,
                    9,
                    56552228
                ],
                [
                    12,
                    6,
                    34352454
                ],
                [
                    11,
                    3,
                    306653038
                ],
                [
                    6,
                    13,
                    31784841
                ],
                [
                    5,
                    14,
                    153955165
                ],
                [
                    6,
                    0,
                    20380268
                ],
                [
                    8,
                    0,
                    61624417
                ],
                [
                    12,
                    3,
                    23667992
                ],
                [
                    10,
                    2,
                    12172234
                ],
                [
                    5,
                    3,
                    152391
                ],
                [
                    13,
                    12,
                    61679979
                ],
                [
                    14,
                    12,
                    16073041
                ],
                [
                    1,
                    5,
                    241454238
                ],
                [
                    0,
                    5,
                    20367648
                ],
                [
                    15,
                    0,
                    226369863
                ],
                [
                    16,
                    0,
                    27366018
                ],
                [
                    14,
                    0,
                    68330435
                ],
                [
                    5,
                    4,
                    22467822
                ],
                [
                    5,
                    5,
                    334930910
                ],
                [
                    2,
                    4,
                    9725736
                ],
                [
                    17,
                    2,
                    43416007
                ],
                [
                    3,
                    3,
                    1469797
                ],
                [
                    4,
                    6,
                    15022110
                ],
                [
                    17,
                    3,
                    23970762
                ],
                [
                    17,
                    1,
                    43405701
                ],
                [
                    18,
                    2,
                    53686138
                ],
                [
                    18,
                    1,
                    42137917
                ],
                [
                    18,
                    3,
                    33754262
                ],
                [
                    3,
                    13,
                    223123456
                ],
                [
                    4,
                    12,
                    38369118
                ],
                [
                    2,
                    8,
                    221665399
                ],
                [
                    1,
                    8,
                    37488567
                ],
                [
                    11,
                    18,
                    55115375
                ],
                [
                    10,
                    18,
                    30348975
                ],
                [
                    12,
                    18,
                    309267066
                ],
                [
                    14,
                    18,
                    33078296
                ],
                [
                    14,
                    15,
                    159286093
                ],
                [
                    5,
                    0,
                    17403265
                ],
                [
                    13,
                    18,
                    238246133
                ],
                [
                    15,
                    18,
                    18631745
                ],
                [
                    3,
                    5,
                    142513504
                ],
                [
                    4,
                    3,
                    27817105
                ],
                [
                    -1,
                    -1,
                    9880875
                ],
                [
                    -1,
                    -1,
                    4291261
                ]
            ],
            "allow_self_capture": false,
            "automatic_stone_removal": false,
            "free_handicap_placement": false,
            "aga_handicap_scoring": false,
            "allow_ko": false,
            "allow_superko": true,
            "superko_algorithm": "ssk",
            "score_territory": true,
            "score_territory_in_seki": false,
            "score_stones": false,
            "score_handicap": false,
            "score_prisoners": true,
            "score_passes": true,
            "white_must_pass_last": false,
            "opponent_plays_first_after_resume": true,
            "strict_seki_mode": false,
            "initial_state": {
                "black": "",
                "white": ""
            },
            "start_time": 1563570060,
            "original_disable_analysis": false,
            "clock": {
                "game_id": 18759438,
                "current_player": 314459,
                "black_player_id": 356,
                "white_player_id": 314459,
                "title": "Tournament Game: 1st 3 Kyu to 3 Dan Tournament (50283) R:1 (HongAnhKhoa vs Dyonn)",
                "last_move": 1583857202249,
                "expiration": 1584462002249,
                "black_time": {
                    "thinking_time": 604800,
                    "skip_bonus": false
                },
                "white_time": {
                    "thinking_time": 604800,
                    "skip_bonus": false
                },
                "now": 1583879747295,
                "paused_since": 1583857202249,
                "pause_delta": 0,
                "expiration_delta": 604800000,
                "stone_removal_mode": true,
                "stone_removal_expiration": 1583966147295
            },
            "pause_control": {
                "stone-removal": true
            },
            "paused_since": 1583857202249,
            "removed": "qapbqbhdheiehfifjfjghhihjhkheigiiijiejgjijikjkkkjlqlbmjmjnlnqnfpcqbrdrer",
            "auto_scoring_done": true,
            "score": {
                "white": {
                    "total": 126.5,
                    "stones": 0,
                    "territory": 78,
                    "prisoners": 42,
                    "scoring_positions": "jakalamakbqarasapbqbibicnblchdheiehfifjfigjghhihjhkhiijiijikjkkkjljmjnkdefdgfgfheifigiejfjgjoimkcllllmlnambmanbnaoboapcpepfpaqcqeqarbrcrdrerfrasbscsdsesfsdo",
                    "handicap": 0,
                    "komi": 6.5
                },
                "black": {
                    "total": 70,
                    "stones": 0,
                    "territory": 67,
                    "prisoners": 3,
                    "scoring_positions": "aabacadaeaabbbcbdbebacbcccdcadbdaemeneoepeqeresemfnfqfrfsfrgsgrhshrisirjsjqkrkskplqlrlslpmqmrmsmpnqnrnsnsosprqsqrrsrqsrsssagahaiipirjs",
                    "handicap": 0,
                    "komi": 0
                }
            },
            "winner": 314459,
            "outcome": "56.5 points",
            "end_time": 1583938533
        }
        """],
        // MARK: - W+ Resigned, 19x19, Handicapped with Initial State
        // MARK: - #23871959
        ["""
        {
            "white_player_id": 749506,
            "black_player_id": 757083,
            "game_id": 23871959,
            "game_name": "Friendly Match",
            "private": false,
            "pause_on_weekends": false,
            "players": {
                "black": {
                    "username": "bsktrgt",
                    "rank": 29.366184380692395,
                    "professional": false,
                    "egf": 999.523,
                    "id": 757083
                },
                "white": {
                    "username": "hhs214",
                    "rank": 31.560869142522165,
                    "professional": false,
                    "egf": 1153.853,
                    "id": 749506
                }
            },
            "ranked": true,
            "disable_analysis": false,
            "handicap": 2,
            "komi": 0.5,
            "width": 19,
            "height": 19,
            "rules": "japanese",
            "time_control": {
                "system": "byoyomi",
                "speed": "live",
                "main_time": 60,
                "period_time": 10,
                "periods": 5,
                "pause_on_weekends": false,
                "time_control": "byoyomi"
            },
            "phase": "finished",
            "initial_player": "white",
            "moves": [
                [
                    3,
                    3,
                    3145
                ],
                [
                    2,
                    3,
                    280
                ],
                [
                    2,
                    4,
                    2787
                ],
                [
                    2,
                    2,
                    1240
                ],
                [
                    3,
                    2,
                    2106
                ],
                [
                    1,
                    4,
                    780
                ],
                [
                    2,
                    5,
                    2446
                ],
                [
                    1,
                    5,
                    632
                ],
                [
                    2,
                    6,
                    1462
                ],
                [
                    3,
                    1,
                    602
                ],
                [
                    4,
                    1,
                    1360
                ],
                [
                    2,
                    1,
                    634
                ],
                [
                    5,
                    2,
                    757
                ],
                [
                    16,
                    16,
                    1599
                ],
                [
                    2,
                    16,
                    4001
                ],
                [
                    3,
                    16,
                    1674
                ],
                [
                    2,
                    15,
                    1898
                ],
                [
                    2,
                    13,
                    1033
                ],
                [
                    1,
                    13,
                    1787
                ],
                [
                    2,
                    12,
                    2090
                ],
                [
                    2,
                    14,
                    1873
                ],
                [
                    3,
                    14,
                    951
                ],
                [
                    1,
                    12,
                    1254
                ],
                [
                    2,
                    11,
                    710
                ],
                [
                    1,
                    11,
                    2122
                ],
                [
                    2,
                    10,
                    802
                ],
                [
                    13,
                    16,
                    3355
                ],
                [
                    10,
                    16,
                    1724
                ],
                [
                    15,
                    15,
                    2879
                ],
                [
                    16,
                    15,
                    1330
                ],
                [
                    15,
                    14,
                    1525
                ],
                [
                    14,
                    17,
                    630
                ],
                [
                    16,
                    14,
                    1743
                ],
                [
                    14,
                    16,
                    814
                ],
                [
                    13,
                    14,
                    1779
                ],
                [
                    14,
                    15,
                    1148
                ],
                [
                    12,
                    13,
                    2039
                ],
                [
                    10,
                    14,
                    2283
                ],
                [
                    16,
                    5,
                    2718
                ],
                [
                    16,
                    8,
                    2190
                ],
                [
                    14,
                    5,
                    8828
                ],
                [
                    13,
                    2,
                    1430
                ],
                [
                    16,
                    10,
                    1975
                ],
                [
                    14,
                    8,
                    1431
                ],
                [
                    17,
                    3,
                    2307
                ],
                [
                    16,
                    2,
                    1712
                ],
                [
                    12,
                    3,
                    2661
                ],
                [
                    12,
                    2,
                    2652
                ],
                [
                    12,
                    8,
                    5617
                ],
                [
                    13,
                    7,
                    1783
                ],
                [
                    11,
                    6,
                    2345
                ],
                [
                    13,
                    5,
                    1260
                ],
                [
                    14,
                    4,
                    3424
                ],
                [
                    13,
                    4,
                    1212
                ],
                [
                    14,
                    3,
                    2750
                ],
                [
                    13,
                    3,
                    916
                ],
                [
                    14,
                    2,
                    1467
                ],
                [
                    8,
                    2,
                    950
                ],
                [
                    14,
                    1,
                    6105
                ],
                [
                    11,
                    12,
                    7757
                ],
                [
                    9,
                    12,
                    4642
                ],
                [
                    8,
                    13,
                    2056
                ],
                [
                    4,
                    13,
                    4170
                ],
                [
                    6,
                    12,
                    3098
                ],
                [
                    4,
                    11,
                    5368
                ],
                [
                    5,
                    14,
                    1777
                ],
                [
                    5,
                    10,
                    6166
                ],
                [
                    4,
                    9,
                    11578
                ],
                [
                    5,
                    9,
                    4100
                ],
                [
                    2,
                    8,
                    1178
                ],
                [
                    1,
                    6,
                    3201
                ],
                [
                    4,
                    7,
                    988
                ],
                [
                    5,
                    8,
                    4916
                ],
                [
                    3,
                    7,
                    3871
                ],
                [
                    6,
                    6,
                    4246
                ],
                [
                    4,
                    5,
                    1568
                ],
                [
                    4,
                    4,
                    1952
                ],
                [
                    5,
                    5,
                    1598
                ],
                [
                    0,
                    5,
                    3307
                ],
                [
                    0,
                    3,
                    1430
                ],
                [
                    7,
                    3,
                    8413
                ],
                [
                    7,
                    2,
                    1994
                ],
                [
                    6,
                    3,
                    3430
                ],
                [
                    8,
                    3,
                    2721
                ],
                [
                    8,
                    4,
                    4003
                ],
                [
                    9,
                    4,
                    1443
                ],
                [
                    3,
                    13,
                    2605
                ],
                [
                    7,
                    4,
                    5396
                ],
                [
                    6,
                    4,
                    3148
                ],
                [
                    8,
                    5,
                    779
                ],
                [
                    6,
                    5,
                    1814
                ],
                [
                    4,
                    10,
                    4965
                ],
                [
                    5,
                    11,
                    4620
                ],
                [
                    3,
                    11,
                    1137
                ],
                [
                    4,
                    8,
                    5446
                ],
                [
                    3,
                    8,
                    1406
                ],
                [
                    3,
                    9,
                    1671
                ],
                [
                    3,
                    10,
                    1377
                ],
                [
                    5,
                    13,
                    3012
                ],
                [
                    6,
                    13,
                    1791
                ],
                [
                    3,
                    17,
                    2951
                ],
                [
                    4,
                    17,
                    2044
                ],
                [
                    2,
                    17,
                    1813
                ],
                [
                    5,
                    6,
                    3347
                ],
                [
                    5,
                    7,
                    4614
                ],
                [
                    3,
                    5,
                    1072
                ],
                [
                    3,
                    6,
                    1574
                ],
                [
                    4,
                    6,
                    3582
                ],
                [
                    3,
                    4,
                    1438
                ],
                [
                    1,
                    7,
                    796
                ],
                [
                    1,
                    9,
                    1832
                ],
                [
                    1,
                    10,
                    1318
                ],
                [
                    0,
                    10,
                    1642
                ],
                [
                    0,
                    11,
                    1256
                ],
                [
                    0,
                    12,
                    2082
                ],
                [
                    1,
                    8,
                    1614
                ],
                [
                    0,
                    9,
                    1648
                ],
                [
                    0,
                    8,
                    1781
                ],
                [
                    1,
                    15,
                    4381
                ],
                [
                    2,
                    9,
                    1695
                ],
                [
                    0,
                    11,
                    2182
                ],
                [
                    0,
                    6,
                    692
                ],
                [
                    0,
                    7,
                    1717
                ],
                [
                    5,
                    12,
                    3894
                ],
                [
                    4,
                    12,
                    3285
                ],
                [
                    0,
                    6,
                    747
                ],
                [
                    5,
                    17,
                    6017
                ],
                [
                    4,
                    16,
                    3312
                ],
                [
                    0,
                    7,
                    2546
                ],
                [
                    0,
                    14,
                    4819
                ],
                [
                    1,
                    14,
                    4198
                ],
                [
                    0,
                    6,
                    1904
                ],
                [
                    5,
                    16,
                    6352
                ],
                [
                    5,
                    15,
                    5514
                ],
                [
                    0,
                    7,
                    2812
                ],
                [
                    5,
                    4,
                    2285
                ],
                [
                    0,
                    6,
                    4596
                ]
            ],
            "allow_self_capture": false,
            "automatic_stone_removal": false,
            "free_handicap_placement": false,
            "aga_handicap_scoring": false,
            "allow_ko": false,
            "allow_superko": true,
            "superko_algorithm": "ssk",
            "score_territory": true,
            "score_territory_in_seki": false,
            "score_stones": false,
            "score_handicap": false,
            "score_prisoners": true,
            "score_passes": true,
            "white_must_pass_last": false,
            "opponent_plays_first_after_resume": true,
            "strict_seki_mode": false,
            "initial_state": {
                "black": "pddp",
                "white": ""
            },
            "start_time": 1589279239,
            "original_disable_analysis": false,
            "clock": {
                "game_id": 23871959,
                "current_player": 757083,
                "black_player_id": 757083,
                "white_player_id": 749506,
                "title": "Friendly Match",
                "last_move": 1589279595497,
                "expiration": 1589279645497,
                "black_time": {
                    "thinking_time": 0,
                    "periods": 5,
                    "period_time": 10
                },
                "white_time": {
                    "thinking_time": 0,
                    "periods": 5,
                    "period_time": 10
                }
            },
            "winner": 749506,
            "outcome": "Resignation",
            "end_time": 1589279598
        }
        """],
        // MARK: - B+ Resigned, 9x9
        // MARK: - #25076729
        ["""
        {
          "white_player_id": 298971,
          "black_player_id": 778820,
          "game_id": 25076729,
          "game_name": "Friendly Match",
          "private": false,
          "pause_on_weekends": false,
          "players": {
            "black": {
              "username": "Phidzad",
              "rank": 21.918201704885952,
              "professional": false,
              "id": 778820
            },
            "white": {
              "username": "Youngparist",
              "rank": 22.07271721620448,
              "professional": false,
              "id": 298971
            }
          },
          "ranked": true,
          "disable_analysis": false,
          "handicap": 0,
          "komi": 5.5,
          "width": 9,
          "height": 9,
          "rules": "japanese",
          "time_control": {
            "system": "simple",
            "speed": "live",
            "per_move": 10,
            "pause_on_weekends": false,
            "time_control": "simple"
          },
          "phase": "finished",
          "initial_player": "black",
          "moves": [
            [
              6,
              5,
              2393
            ],
            [
              3,
              5,
              1174
            ],
            [
              2,
              3,
              1388
            ],
            [
              6,
              2,
              1379
            ],
            [
              4,
              2,
              1142
            ],
            [
              5,
              4,
              1266
            ],
            [
              5,
              6,
              2771
            ],
            [
              4,
              6,
              939
            ],
            [
              7,
              3,
              1583
            ],
            [
              7,
              2,
              1260
            ],
            [
              5,
              7,
              1138
            ],
            [
              6,
              3,
              1188
            ],
            [
              7,
              4,
              1275
            ],
            [
              4,
              7,
              1275
            ],
            [
              1,
              5,
              1682
            ],
            [
              7,
              6,
              3096
            ],
            [
              7,
              7,
              2542
            ],
            [
              6,
              6,
              2081
            ],
            [
              5,
              5,
              1639
            ],
            [
              6,
              7,
              4617
            ],
            [
              6,
              8,
              1466
            ],
            [
              8,
              7,
              1830
            ],
            [
              7,
              8,
              3612
            ],
            [
              7,
              5,
              1895
            ],
            [
              6,
              4,
              1502
            ],
            [
              8,
              6,
              3117
            ],
            [
              8,
              4,
              2103
            ],
            [
              3,
              2,
              4402
            ],
            [
              3,
              3,
              1826
            ],
            [
              4,
              3,
              1006
            ],
            [
              4,
              4,
              1847
            ],
            [
              5,
              3,
              1389
            ],
            [
              4,
              5,
              3092
            ],
            [
              3,
              4,
              1031
            ],
            [
              2,
              2,
              4069
            ],
            [
              3,
              1,
              3712
            ],
            [
              8,
              5,
              3548
            ],
            [
              2,
              1,
              5718
            ],
            [
              1,
              4,
              5360
            ],
            [
              2,
              6,
              2842
            ],
            [
              1,
              6,
              1993
            ],
            [
              1,
              7,
              861
            ],
            [
              0,
              7,
              1763
            ],
            [
              1,
              8,
              4192
            ],
            [
              3,
              7,
              1871
            ],
            [
              3,
              8,
              1338
            ],
            [
              2,
              7,
              4660
            ],
            [
              3,
              6,
              1556
            ],
            [
              1,
              1,
              2885
            ],
            [
              2,
              8,
              1546
            ],
            [
              1,
              0,
              2233
            ],
            [
              2,
              0,
              4917
            ],
            [
              0,
              2,
              2465
            ]
          ],
          "allow_self_capture": false,
          "automatic_stone_removal": false,
          "free_handicap_placement": false,
          "aga_handicap_scoring": false,
          "allow_ko": false,
          "allow_superko": true,
          "superko_algorithm": "ssk",
          "score_territory": true,
          "score_territory_in_seki": false,
          "score_stones": false,
          "score_handicap": false,
          "score_prisoners": true,
          "score_passes": true,
          "white_must_pass_last": false,
          "opponent_plays_first_after_resume": true,
          "strict_seki_mode": false,
          "initial_state": {
            "black": "",
            "white": ""
          },
          "start_time": 1593517436,
          "original_disable_analysis": false,
          "clock": {
            "game_id": 25076729,
            "current_player": 298971,
            "black_player_id": 778820,
            "white_player_id": 298971,
            "title": "Friendly Match",
            "last_move": 1593517559475,
            "expiration": 1593517569475,
            "black_time": 10,
            "white_time": 1593517569475
          },
          "winner": 778820,
          "outcome": "Resignation",
          "end_time": 1593517560
        }
        """],
        // MARK: - Ongoing, 19x19, Handicapped with No Initial State
        // MARK: - #25291907
        ["""
        {
          "white_player_id": 686323,
          "black_player_id": 798782,
          "game_id": 25291907,
          "game_name": "Friendly Match",
          "private": false,
          "pause_on_weekends": false,
          "players": {
            "black": {
              "username": "Masamune fan",
              "rank": 30.609698641461705,
              "professional": false,
              "id": 798782
            },
            "white": {
              "username": "masamune_40b",
              "rank": 38.844930118959546,
              "professional": false,
              "id": 686323
            }
          },
          "ranked": true,
          "disable_analysis": false,
          "handicap": 2,
          "komi": 0.5,
          "width": 19,
          "height": 19,
          "rules": "chinese",
          "time_control": {
            "system": "byoyomi",
            "time_control": "byoyomi",
            "speed": "live",
            "pause_on_weekends": false,
            "main_time": 3600,
            "period_time": 50,
            "periods": 5
          },
          "phase": "play",
          "initial_player": "black",
          "moves": [
            [
              3,
              2,
              3882
            ],
            [
              2,
              15,
              2547
            ],
            [
              16,
              15,
              56531
            ],
            [
              15,
              3,
              71342
            ],
            [
              4,
              16,
              48702
            ],
            [
              3,
              14,
              46167
            ],
            [
              13,
              15,
              49756
            ],
            [
              3,
              4,
              59933
            ],
            [
              16,
              5,
              51256
            ],
            [
              13,
              2,
              43790
            ],
            [
              7,
              15,
              47142
            ],
            [
              16,
              8,
              73139
            ],
            [
              16,
              10,
              53341
            ],
            [
              15,
              16,
              30522
            ],
            [
              15,
              15,
              49781
            ],
            [
              9,
              3,
              41780
            ],
            [
              14,
              5,
              53857
            ]
          ],
          "allow_self_capture": false,
          "automatic_stone_removal": false,
          "free_handicap_placement": true,
          "aga_handicap_scoring": false,
          "allow_ko": false,
          "allow_superko": false,
          "superko_algorithm": "ssk",
          "score_territory": true,
          "score_territory_in_seki": true,
          "score_stones": true,
          "score_handicap": true,
          "score_prisoners": false,
          "score_passes": true,
          "white_must_pass_last": false,
          "opponent_plays_first_after_resume": false,
          "strict_seki_mode": false,
          "initial_state": {
            "black": "",
            "white": ""
          },
          "start_time": 1594268000,
          "original_disable_analysis": false,
          "clock": {
            "game_id": 25291907,
            "current_player": 798782,
            "black_player_id": 798782,
            "white_player_id": 686323,
            "title": "Friendly Match",
            "last_move": 1594268783468,
            "expiration": 1594272266794,
            "black_time": {
              "thinking_time": 3233.3259999999996,
              "periods": 5,
              "period_time": 50
            },
            "white_time": {
              "thinking_time": 3189.635,
              "periods": 5,
              "period_time": 50
            }
          },
          "auto_score": true
        }
        """],
        // MARK: - B+ Scored, 15x17(!)
        // MARK: - #25758368
        ["""
        {
          "white_player_id": 435826,
          "black_player_id": 796361,
          "group_ids": [],
          "game_id": 25758368,
          "game_name": "A Book-Like Shape",
          "private": false,
          "pause_on_weekends": false,
          "players": {
            "black": {
              "username": "on_alpes",
              "rank": 29.668028269149687,
              "professional": false,
              "id": 796361,
              "accepted_stones": "ickekfoffhghdieigihjcodolp",
              "accepted_strict_seki_mode": false
            },
            "white": {
              "username": "Kevin052601",
              "rank": 28.841007382647856,
              "professional": false,
              "id": 435826,
              "accepted_stones": "ickekfoffhghdieigihjcodolp",
              "accepted_strict_seki_mode": false
            }
          },
          "ranked": false,
          "disable_analysis": false,
          "handicap": 0,
          "komi": 6.5,
          "width": 15,
          "height": 17,
          "rules": "japanese",
          "time_control": {
            "system": "byoyomi",
            "speed": "live",
            "main_time": 900,
            "period_time": 30,
            "periods": 5,
            "pause_on_weekends": false,
            "time_control": "byoyomi"
          },
          "phase": "finished",
          "initial_player": "black",
          "moves": [
            [
              12,
              3,
              20953
            ],
            [
              10,
              2,
              4101
            ],
            [
              2,
              13,
              5186
            ],
            [
              4,
              13,
              5175
            ],
            [
              3,
              2,
              3114
            ],
            [
              11,
              4,
              2801
            ],
            [
              12,
              4,
              4439
            ],
            [
              11,
              5,
              1540
            ],
            [
              12,
              6,
              772
            ],
            [
              11,
              6,
              1941
            ],
            [
              12,
              7,
              3667
            ],
            [
              11,
              7,
              985
            ],
            [
              11,
              13,
              16584
            ],
            [
              12,
              8,
              2145
            ],
            [
              11,
              2,
              18416
            ],
            [
              11,
              3,
              3207
            ],
            [
              12,
              1,
              7976
            ],
            [
              11,
              1,
              2368
            ],
            [
              12,
              2,
              1586
            ],
            [
              9,
              14,
              1506
            ],
            [
              12,
              11,
              7500
            ],
            [
              11,
              15,
              5692
            ],
            [
              12,
              14,
              16015
            ],
            [
              2,
              14,
              3007
            ],
            [
              1,
              14,
              5714
            ],
            [
              3,
              14,
              1086
            ],
            [
              1,
              12,
              820
            ],
            [
              9,
              12,
              1416
            ],
            [
              12,
              15,
              5751
            ],
            [
              2,
              11,
              7746
            ],
            [
              3,
              12,
              7686
            ],
            [
              4,
              11,
              1455
            ],
            [
              2,
              10,
              25471
            ],
            [
              3,
              11,
              5399
            ],
            [
              1,
              11,
              3787
            ],
            [
              5,
              2,
              2660
            ],
            [
              9,
              2,
              18548
            ],
            [
              10,
              1,
              11552
            ],
            [
              8,
              3,
              4851
            ],
            [
              9,
              1,
              6282
            ],
            [
              7,
              2,
              11148
            ],
            [
              8,
              1,
              2997
            ],
            [
              5,
              3,
              10589
            ],
            [
              4,
              2,
              11655
            ],
            [
              4,
              3,
              2169
            ],
            [
              3,
              1,
              980
            ],
            [
              2,
              1,
              4511
            ],
            [
              3,
              3,
              13515
            ],
            [
              2,
              2,
              1933
            ],
            [
              6,
              2,
              9098
            ],
            [
              6,
              3,
              15009
            ],
            [
              7,
              1,
              1517
            ],
            [
              3,
              4,
              12623
            ],
            [
              7,
              4,
              1566
            ],
            [
              7,
              3,
              4980
            ],
            [
              2,
              7,
              1534
            ],
            [
              3,
              8,
              12315
            ],
            [
              4,
              6,
              2334
            ],
            [
              5,
              7,
              6888
            ],
            [
              5,
              6,
              2445
            ],
            [
              6,
              7,
              4639
            ],
            [
              6,
              6,
              1345
            ],
            [
              7,
              6,
              7611
            ],
            [
              7,
              7,
              1551
            ],
            [
              8,
              6,
              8587
            ],
            [
              8,
              7,
              11380
            ],
            [
              9,
              6,
              39158
            ],
            [
              4,
              7,
              35515
            ],
            [
              4,
              8,
              4709
            ],
            [
              5,
              8,
              1484
            ],
            [
              6,
              8,
              2165
            ],
            [
              5,
              9,
              1165
            ],
            [
              7,
              9,
              40594
            ],
            [
              9,
              7,
              33581
            ],
            [
              7,
              11,
              59121
            ],
            [
              2,
              9,
              39087
            ],
            [
              1,
              9,
              78423
            ],
            [
              2,
              8,
              74309
            ],
            [
              3,
              10,
              9222
            ],
            [
              3,
              9,
              1451
            ],
            [
              4,
              10,
              55947
            ],
            [
              4,
              9,
              3961
            ],
            [
              5,
              10,
              3885
            ],
            [
              6,
              9,
              1371
            ],
            [
              5,
              11,
              7585
            ],
            [
              6,
              13,
              11439
            ],
            [
              8,
              13,
              15614
            ],
            [
              9,
              13,
              8083
            ],
            [
              7,
              13,
              7958
            ],
            [
              6,
              14,
              4695
            ],
            [
              7,
              15,
              15156
            ],
            [
              7,
              14,
              10732
            ],
            [
              8,
              14,
              24602
            ],
            [
              8,
              15,
              2465
            ],
            [
              9,
              15,
              884
            ],
            [
              8,
              16,
              5034
            ],
            [
              9,
              16,
              7590
            ],
            [
              7,
              12,
              2010
            ],
            [
              7,
              16,
              844
            ],
            [
              8,
              15,
              1096
            ],
            [
              8,
              16,
              925
            ],
            [
              8,
              12,
              1553
            ],
            [
              10,
              14,
              50136
            ],
            [
              12,
              5,
              15546
            ],
            [
              13,
              5,
              2309
            ],
            [
              13,
              8,
              1805
            ],
            [
              13,
              7,
              2034
            ],
            [
              14,
              7,
              15737
            ],
            [
              13,
              6,
              4504
            ],
            [
              7,
              10,
              1600
            ],
            [
              8,
              11,
              52753
            ],
            [
              8,
              10,
              12275
            ],
            [
              9,
              11,
              48585
            ],
            [
              9,
              10,
              52426
            ],
            [
              10,
              11,
              14529
            ],
            [
              8,
              15,
              68849
            ],
            [
              5,
              15,
              41659
            ],
            [
              6,
              15,
              39201
            ],
            [
              6,
              16,
              2520
            ],
            [
              5,
              14,
              16400
            ],
            [
              4,
              15,
              16713
            ],
            [
              4,
              12,
              46248
            ],
            [
              3,
              13,
              48593
            ],
            [
              5,
              12,
              129891
            ],
            [
              4,
              14,
              11050
            ],
            [
              1,
              4,
              10333
            ],
            [
              1,
              3,
              17797
            ],
            [
              2,
              4,
              5955
            ],
            [
              2,
              3,
              10204
            ],
            [
              6,
              5,
              4590
            ],
            [
              2,
              5,
              44732
            ],
            [
              1,
              5,
              6132
            ],
            [
              8,
              4,
              50254
            ],
            [
              12,
              0,
              39638
            ],
            [
              13,
              0,
              2498
            ],
            [
              11,
              0,
              3023
            ],
            [
              14,
              1,
              4259
            ],
            [
              14,
              11,
              9938
            ],
            [
              11,
              9,
              27118
            ],
            [
              11,
              8,
              27834
            ],
            [
              13,
              10,
              17405
            ],
            [
              14,
              10,
              2361
            ],
            [
              14,
              9,
              4076
            ],
            [
              13,
              9,
              1992
            ],
            [
              14,
              12,
              1525
            ],
            [
              14,
              8,
              1319
            ],
            [
              13,
              11,
              1842
            ],
            [
              14,
              5,
              7146
            ],
            [
              13,
              4,
              5232
            ],
            [
              14,
              9,
              6591
            ],
            [
              13,
              12,
              6199
            ],
            [
              4,
              1,
              12375
            ],
            [
              6,
              4,
              20196
            ],
            [
              7,
              5,
              8024
            ],
            [
              3,
              5,
              18047
            ],
            [
              2,
              6,
              21896
            ],
            [
              4,
              5,
              1730
            ],
            [
              2,
              0,
              11226
            ],
            [
              1,
              0,
              6102
            ],
            [
              3,
              0,
              1081
            ],
            [
              0,
              1,
              6329
            ],
            [
              10,
              9,
              1318
            ],
            [
              11,
              10,
              22026
            ],
            [
              10,
              6,
              3440
            ],
            [
              9,
              4,
              8567
            ],
            [
              1,
              8,
              3516
            ],
            [
              0,
              4,
              6542
            ],
            [
              1,
              6,
              6640
            ],
            [
              6,
              11,
              11217
            ],
            [
              6,
              12,
              5139
            ],
            [
              8,
              14,
              4862
            ],
            [
              8,
              13,
              1444
            ],
            [
              14,
              6,
              21629
            ],
            [
              0,
              9,
              3300
            ],
            [
              1,
              10,
              2415
            ],
            [
              2,
              12,
              1606
            ],
            [
              1,
              13,
              2525
            ],
            [
              0,
              5,
              2099
            ],
            [
              0,
              3,
              1736
            ],
            [
              5,
              5,
              3243
            ],
            [
              5,
              4,
              1444
            ],
            [
              10,
              12,
              22076
            ],
            [
              11,
              12,
              4014
            ],
            [
              0,
              10,
              20911
            ],
            [
              0,
              11,
              3635
            ],
            [
              0,
              8,
              1248
            ],
            [
              10,
              10,
              5746
            ],
            [
              6,
              10,
              6448
            ],
            [
              12,
              9,
              8537
            ],
            [
              3,
              6,
              4596
            ],
            [
              10,
              15,
              30924
            ],
            [
              10,
              3,
              3751
            ],
            [
              9,
              3,
              2551
            ],
            [
              8,
              5,
              2809
            ],
            [
              9,
              5,
              2038
            ],
            [
              8,
              15,
              2785
            ],
            [
              10,
              13,
              10925
            ],
            [
              8,
              14,
              45984
            ],
            [
              -1,
              -1,
              14292
            ],
            [
              -1,
              -1,
              2490
            ]
          ],
          "allow_self_capture": false,
          "automatic_stone_removal": false,
          "free_handicap_placement": true,
          "aga_handicap_scoring": false,
          "allow_ko": false,
          "allow_superko": true,
          "superko_algorithm": "ssk",
          "score_territory": true,
          "score_territory_in_seki": false,
          "score_stones": false,
          "score_handicap": false,
          "score_prisoners": true,
          "score_passes": true,
          "white_must_pass_last": false,
          "opponent_plays_first_after_resume": true,
          "strict_seki_mode": false,
          "initial_state": {
            "black": "",
            "white": ""
          },
          "start_time": 1596009142,
          "original_disable_analysis": false,
          "clock": {
            "game_id": 25758368,
            "current_player": 796361,
            "black_player_id": 796361,
            "white_player_id": 435826,
            "title": "A Book-Like Shape",
            "last_move": 1596011604062,
            "expiration": 1596011664062,
            "black_time": {
              "thinking_time": 0,
              "periods": 2,
              "period_time": 30
            },
            "white_time": {
              "thinking_time": 0,
              "periods": 4,
              "period_time": 30
            },
            "pause_delta": 0,
            "expiration_delta": 60000,
            "now": 1596011605446,
            "paused_since": 1596011604062,
            "stone_removal_mode": true,
            "stone_removal_expiration": 1596011905446
          },
          "pause_control": {
            "stone-removal": true
          },
          "paused_since": 1596011604062,
          "removed": "ickekfoffhghdieigihjcodolp",
          "auto_scoring_done": true,
          "score": {
            "white": {
              "total": 45.5,
              "stones": 0,
              "territory": 28,
              "prisoners": 11,
              "scoring_positions": "eafagahaiajakafbgbagahbhdhdieifhghkhgihiiijikihjijjjfnhn",
              "handicap": 0,
              "komi": 6.5
            },
            "black": {
              "total": 55,
              "stones": 0,
              "territory": 46,
              "prisoners": 9,
              "scoring_positions": "aaoabbacbcnbncocndodoeofddeemkllamanaocodoapbpcpdpaqbqcqdqeqfqmmmnnnonlonooolpnpopkqlqmqnqoq",
              "handicap": 0,
              "komi": 0
            }
          },
          "winner": 796361,
          "outcome": "9.5 points",
          "end_time": 1596011614
        }
        """]
    ]

}
