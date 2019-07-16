package main

import (
	"flag"
	"fmt"
	"io/ioutil"
)

func main() {

	filenamePtr := flag.String("file")
	bytesPtr := flag.Int("byte")

	flag.Parse()

	d1 := []byte("hello\ngo\n")
	ioutil.WriteFile(*filenamePtr, d1, 0644)
}
