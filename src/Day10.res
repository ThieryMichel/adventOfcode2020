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

let parsedInput = Js.String2.split(input, "\n")->Js.Array2.map(int_of_string)->Js.Array2.sortInPlaceWith((a, b) => a - b);

let intervals = Js.Array2.reducei(parsedInput, (acc, number, index) => {
    switch (Belt.Array.get(parsedInput, index + 1)) {
        | Some(next) => Belt.Array.concat(acc, [next - number]);
        | None => Belt.Array.concat(acc, [3]);;
    }
}, [parsedInput[0]]);

Js.log(intervals)


let countInArray = (array, itemToCount) => {
    Js.Array2.filter(array, item => item === itemToCount)->Js.Array2.length;
};

let nbOne = countInArray(intervals, 1);
let nbThree = countInArray(intervals, 3);

let result = nbOne * nbThree;
Js.log(result);

