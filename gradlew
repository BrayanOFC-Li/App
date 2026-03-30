#!/usr/bin/env sh

# Gradle wrapper script that automatically downloads the Gradle distribution.

set -e

GRADLE_VERSION=7.4.2
GRADLE_FILE=gradle-${GRADLE_VERSION}-bin.zip
GRADLE_URL=https://services.gradle.org/distributions/$GRADLE_FILE

if [ ! -f "gradle/wrapper/gradle-wrapper.jar" ]; then
    echo "Downloading Gradle Wrapper..."
    mkdir -p gradle/wrapper
    curl -L -o "gradle/wrapper/$GRADLE_FILE" "$GRADLE_URL"
    echo "Unzipping Gradle..."
    unzip -q "gradle/wrapper/$GRADLE_FILE" -d gradle/wrapper
    echo "Gradle downloaded and unzipped."
fi

exec java -jar gradle/wrapper/gradle-wrapper.jar "$@"
