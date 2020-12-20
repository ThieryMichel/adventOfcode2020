let input = `1000390
13,x,x,41,x,x,x,x,x,x,x,x,x,997,x,x,x,x,x,x,x,23,x,x,x,x,x,x,x,x,x,x,19,x,x,x,x,x,x,x,x,x,29,x,619,x,x,x,x,x,37,x,x,x,x,x,x,x,x,x,x,17`;

let parseInput = input => {
    let [line1, line2] = Js.String2.split(input, "\n");

    let idList = Js.String2.split(line2, ",") -> Js.Array2.reduce((acc, item) => {
        switch(Belt.Int.fromString(item)) {
            | None => acc;
            | Some(number) => Js.Array2.concat(acc, [number]);
        }
    }, []);

    (Belt.Int.fromString(line1)->Belt.Option.getExn, idList);
}

let (target, idList) = parseInput(input);

let (id, wait) = Js.Array2.map(idList, (id) => (id, id - mod(target, id)))
    -> Js.Array2.reduce(((resultId, resultScore), (id, score)) => {
        if (score < resultScore) {
            (id, score);
        } else {
            (resultId, resultScore);
        }
    }, (target, target));

Js.log(id * wait);
