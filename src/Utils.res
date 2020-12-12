let splitInTwo = (separator, value) => {
    switch(Js.String2.split(value, separator)) {
        | [first, second] => (first, second);
        | [first] => (first, "");
        | _ => ("", "");
    };
}