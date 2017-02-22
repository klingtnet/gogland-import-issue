package mylib

import (
	"fmt"

	"github.com/sirupsen/logrus"
)

func Do(action string) string {
	msg := fmt.Sprintf("I am %sing!\n", action)
	logrus.Warn(msg)
	return msg
}
