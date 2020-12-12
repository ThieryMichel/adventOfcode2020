// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';


function splitInTwo(separator, value) {
  var match = value.split(separator);
  var len = match.length;
  if (len >= 3) {
    return [
            "",
            ""
          ];
  }
  switch (len) {
    case 0 :
        return [
                "",
                ""
              ];
    case 1 :
        var first = match[0];
        return [
                first,
                ""
              ];
    case 2 :
        var first$1 = match[0];
        var second = match[1];
        return [
                first$1,
                second
              ];
    
  }
}

exports.splitInTwo = splitInTwo;
/* No side effect */
