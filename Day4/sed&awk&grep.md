# AWK , Sed , Grep

_Dummy Data_

```bash
cat > file1.txt << eof
id, firstname, lastname, email, profession, country
1,  Badhon,  Biswas,  badhon@example.com,  Software Engineer,  Bangladesh
2,  John, Smith,  john.smith@example.com, Web Developer, USA
3, Sarah, Johnson, sarah.j@example.com, Data Analyst, Canada
4, Ahmed, Rahman, ahmed.r@example.com, DevOps Engineer, Bangladesh
5, Emma, Brown, emma.brown@example.com, UI Designer, UK
6, Michael, Davis, michael.d@example.com, System Administrator, Australia
7, Fatima, Akter, fatima.a@example.com, Network Engineer, Bangladesh
8, David, Wilson, david.w@example.com, Cybersecurity Analyst, USA
9, Sophia, Garcia, sophia.g@example.com, Project Manager, Spain
10, Arif, Hossain, arif.h@example.com, Database Administrator, Bangladesh
11, Olivia, Martin, olivia.m@example.com, Software Tester, France
12, James, Anderson, james.a@example.com, Cloud Engineer, USA
13, Nusrat, Jahan, nusrat.j@example.com, Graphic Designer, Bangladesh
14, William, Thomas, william.t@example.com, IT Consultant, Canada
15, Ayesha, Khan, ayesha.k@example.com, Ethical Hacker, Pakistan
16, Daniel, Lee, daniel.lee@example.com, Backend Developer, Singapore
17, Maria, Lopez, maria.l@example.com, Product Manager, Mexico
18, Rakib, Hasan, rakib.h@example.com, Frontend Developer, Bangladesh
19, Emily, Clark, emily.c@example.com, Data Scientist, UK
20, Robert, Hall, robert.h@example.com, Cloud Architect, USA
eof
```

---

## AWK

```bash
# Print All Content
$ awk '{print}' file1.txt

# Print first column of Code $1 = Line of the Column in the code
$ awk '{print $1}' file1.txt

# Find the line using text
$ awk '/badhon/ {print}' file1.txt
$ awk '/info/ {print $1, $3, $5}' file1.txt

# Redirect the output of a new file
$ awk '/badhon/ {print}' file1.txt > only_badhon.txt

# Find the number of word count
$ awk '/badhon/ {count++} END {print "THe count of INFO is", count}' file1.txt


# The time Stamp Search range
$ awk '{print $2}' file1.txt
$ awk '$2 >="08:53:23" & $2 <="08:53:29" {print}' file1.txt

# Line range
$ awk 'NR >=2 && NR <=10 {print }' file1.txt
$ awk 'NR >=2 && NR <=10 {print NR}' file1.txt
```

---

## SED

sed = stream editor
sed = filtering and transforming text based on patterns using strings or regular expressions
make log files more useful

<!-- $ sed command inputFile -->

```bash
# Input Command
$ sed command inputFile

$ sed '' file1.txt

# Filter Out only name that have badhon
$ sed -n '/badhon/p' file1.txt


# Replace the text into the file
$ sed -n '/Software/p'  file1.txt
$ sed 's/Software/Software1/g'  file1.txt

# p = command to print the line
$ sed 'p' /etc/passwd

# -n option to suppress automatic printing of pattern space
$ sed -n 'p' 'badhon' file1.txt


# Search for a string
$ sed 's/Software/Software123/' file1.txt
$ sed 's/Software/Software123/' file1.txt > file3.txt

# Changed in the file
$ sed -i 's/Software/Software123/' file1.txt

# Delimiters


```
