setlocal EnableDelayedExpansion

ECHO "### Start TESTING"
ECHO "### [JAVA] Infos about JDK locations"
ECHO "JAVA_HOME = %JAVA_HOME%"
ECHO "JDK_HOME = %JDK_HOME%"
ECHO "ARCH = %ARCH%"
ECHO "OSX_ARCH = %OSX_ARCH%"
ECHO "RECIPE_DIR = %RECIPE_DIR%"

ECHO "### [JAVA] Try run java"
java -version

ECHO "### [JAVA] Try run %JAVA_HOME%"
%JAVA_HOME%/bin/java.exe -version

ECHO "### [EXE] RUN ILP SOLVER TEST"
%R% -e "source('%RECIPE_DIR:\=/%/test_script.R')"
if errorlevel 1 exit 1

ECHO "### [EXE] CHECK ILP SOLVER TEST"
If not exist "%cd%\test_fragtree.json" (
    echo "Framgentation tree test [EXE] failed!"
    exit 1
)

echo "Success!"
exit 0
