let input = `99
128
154
160
61
107
75
38
15
11
129
94
157
84
121
14
119
48
30
10
55
108
74
104
91
45
134
109
164
66
146
44
116
89
79
32
149
1
136
58
96
7
60
23
31
3
65
110
90
37
43
115
122
52
113
123
161
50
95
150
120
101
126
151
114
127
73
82
162
140
51
144
36
4
163
85
42
59
67
64
86
49
2
145
135
22
24
33
137
16
27
70
133
130
20
21
83
143
100
41
76
17`;

let three = Int64.of_int(3);
let two = Int64.of_int(2);
let one = Int64.of_int(1);

let parsedInput: array<Int64.t> = Js.String2.split(input, "\n")->Js.Array2.map(value => Int64.of_string(value))->Js.Array2.sortInPlaceWith((a, b) => Int64.to_int(a) - Int64.to_int(b));

let getAtKey = (obj, key: Int64.t) => Js.Dict.get(obj, Int64.to_string(key))->Belt.Option.getWithDefault(Int64.of_int(0));

let result = Belt.Array.reduce(parsedInput, Js.Dict.fromArray([("0", Int64.of_int(1))]), (computed, number) => {
    let passes = Int64.add(getAtKey(computed, Int64.sub(number, one)), getAtKey(computed, Int64.sub(number, two)))
        ->Int64.add( getAtKey(computed, Int64.sub(number, three)));
    Js.Dict.set(computed, Int64.to_string(number), passes);
    computed
}) -> Js.Dict.values -> Js.Array2.pop -> Belt.Option.getExn -> Int64.to_string;

Js.log(result);
