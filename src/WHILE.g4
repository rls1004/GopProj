/**
 * Define a grammar called Hello
 */
grammar WHILE;

@header {
package generated;
import java.util.*;
}

@parser::members {
    Map<String, Integer> map = new HashMap<>();
}

program returns [int ss]
    :  exp=aexpr {$ss = $exp.sv;System.out.println($ss);}
    ;

aexpr returns [int sv]
    : N
    {String n = $N.getText(); $sv = Integer.parseInt(n);}
    | IDENT
    {String id = $IDENT.getText(); $sv = map.get(id);}
    | a1=aexpr '*' a2=aexpr
    {$sv = ($a1.sv * $a2.sv);}
    | a1=aexpr '/' a2=aexpr
    {$sv = ($a1.sv * $a2.sv);}
    | a1=aexpr '+' a2=aexpr
    {$sv = ($a1.sv + $a2.sv);}
    | a1=aexpr '-' a2=aexpr
    {$sv = ($a1.sv - $a2.sv);}
    ;

    N : [1-9][0-9]*
    ;

    IDENT : [a-zA-Z]*
    ;

    WS : ( ' '
         | '\t'
         | '\r'
         | '\n'
         )+
         -> channel(HIDDEN)
         ;