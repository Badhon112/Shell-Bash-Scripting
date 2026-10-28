When you use [, logical and or logical or, we need to use -o or -a options]

["$condition1" -o "$condition2"] [condition -a condition]
[[condition || condition2]] [[condition1 && condition2]]

Whenever we are using regular expression | & ,\*

[[x = "x*"]] ===> False
[[x =~ "x*"]] ===> True

[[< > <= =>]] ==> String operations

-eq, -le, -lt, gt, ge, -ne ==> integer operations

---

## Case

**Syntax**

```bash
case <variable_name> in
    var1 )
        statements1
        statements2
        ;;
    var2 )
        statements1
        statements2
        ;;
    * )
        statements1
        statements2
        ;;
esac
```

case values should a whole number or a string, you can't use floating number as case values

---

## Loop

In loop , there are 4 types

for
while
until
select

```bash
# for loop Syntax

for <variable_name> in
do
    statements
    statements
done

for (initialization;;condition;;increment)
do
    statements
done



```
