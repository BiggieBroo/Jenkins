#!/usr/bin/env groovy
import com.example.Java

def call() {
	return new Java(this).buildJar()
}