# WEKA Docker
WEKA can run in container with some constraints:
- Only on Linux system (Only Ubuntu 20.04LTS have been tested, but any Linux distribution with X11 should work as well)
- Only hsqldb can be use for experiment (if the database is needed) as the jdbc can only be configured for one particular database engine at same time. (hsqldb will run with WEKA together.)
