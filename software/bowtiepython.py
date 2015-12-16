#!/usr/bin/env python
import gzip
import subprocess
import argparse

parser = argparse.ArgumentParser(description='Process some integers.')
parser.add_argument('strain', nargs=1,type=str)
parser.add_argument('BL6index', nargs=1,type=str)
parser.add_argument('CASTindex', nargs=1,type=str)
parser.add_argument('paired', nargs=1,type=str)
parser.add_argument('mate1', nargs=1,type=str)
parser.add_argument('mate2', nargs='?',type=str)

args = parser.parse_args()

if args.strain[0] == "C57BL6J":
    index = args.BL6index[0]
else:
    index = args.CASTindex[0]

read1 = gzip.open(args.mate1[0]).read()

if "PE" == "PE":
    read2 = gzip.open(args.mate2).read()
    p1 = subprocess.Popen(
            ["bowtie2", "-p", "12", "-x", index, "-1", read1, "-2", read2, "-S", "out.sam", "-I", "99", "-X", "1000",
             "--no-discordant", "--no-unal"], stdout=subprocess.PIPE)
else:
    p1 = subprocess.Popen(["bowtie2", "-p", "12", "-x", index, "-U", read1, "-S", "out.sam", "--no-unal"], stdout=subprocess.PIPE)

p2 = subprocess.Popen(["samtools", "view", "-hSb", "-"], stdin=p1.stdout, stdout=subprocess.PIPE)
p1.stdout.close()
p3 = subprocess.Popen(
        ["samtools", "sort", "-o" "out.sorted.bam", "-@", "5", "-m", "25G", "-T", "tmp.sort"],
        stdin=p2.stdout)
p2.stdout.close()
p4 = subprocess.Popen(["samtools", "index", 'out.sorted.bam'])
