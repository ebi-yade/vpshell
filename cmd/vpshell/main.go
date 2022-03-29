package main

import (
	"fmt"

	"github.com/alecthomas/kingpin"
)

var Version = "current"

func main() {
	kingpin.Command("version", "show version")
	kingpin.Command("init", "initialize configuration")

	sub := kingpin.Parse()

	switch sub {
	case "version":
		fmt.Println("vpshell", Version)
	case "init":
		panic("implement me!")
	case "up":
		panic("implement me!")
	}
}
