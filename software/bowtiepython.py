#!/usr/bin/env python
import subprocess
import argparse


def doargs():
    parser = argparse.ArgumentParser(description='Process some integers.')
    parser.add_argument('strain', nargs=1, type=str)
    parser.add_argument('BL6index', nargs=1, type=str)
    parser.add_argument('CASTindex', nargs=1, type=str)
    parser.add_argument('paired', nargs=1, type=str)
    parser.add_argument('mate1', nargs=1, type=str)
    parser.add_argument('mate2', nargs='?', type=str)
    return parser.parse_args()


def bowtie(args):
    if args.strain[0] == "C57BL6J":
        indexfile = args.BL6index[0]
    else:
        indexfile = args.CASTindex[0]
    if args.paired[0] == "PE":
        p1 = subprocess.Popen(
                ["bowtie2", "-p", "12", "-x", indexfile, "-1", args.mate1[0], "-2", args.mate2,
                 "-I", "99", "-X", "1000", "--no-discordant", "--no-unal"], stdout=subprocess.PIPE)
    elif args.paired[0] == "SE":
        p1 = subprocess.Popen(
                ["bowtie2", "-p", "12", "-x", indexfile, "-U", args.mate1[0], "--no-unal"],
                stdout=subprocess.PIPE)
    else:
        print("Unknown Command")
        exit("1")
    p2 = subprocess.Popen(["samtools", "view", "-hSb", "-"], stdin=p1.stdout, stdout=subprocess.PIPE)
    p1.stdout.close()
    p3 = subprocess.Popen(
            ["samtools", "sort", "-o" "out.sorted.bam", "-@", "5", "-m", "25G", "-T", "tmp.sort"],
            stdin=p2.stdout)
    p2.stdout.close()
    p3.wait()
    if p3.returncode != 0:
        exit(p3.returncode)


def index():
    p4 = subprocess.Popen(["samtools", "index", 'out.sorted.bam'])
    if p4.returncode != 0:
        exit(p4.returncode)


if __name__ == "__main__":
    bowtie(doargs())
    index()
