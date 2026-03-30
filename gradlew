#!/usr/bin/env sh

#
# Gradle Wrapper
#
# `gradlew` is a thin shell script that delegates to Gradle's native executables.
# It allows you to run Gradle without requiring the user to separately install it
# on their machine.

echo "Executing Gradle wrapper..."

# Set the GRADLE_HOME variable to the location of the Gradle installation.
GRADLE_HOME=`dirname "$0"`/gradle

# Call the Gradle wrapper script located at the specified location.
exec "$GRADLE_HOME/bin/gradle" "$@"