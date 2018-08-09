packagePath=($GOPATH/src/golang.org/x);
Url=(https://github.com/golang);


function Get
{
for package in $@;
do
    if [ -d ${packagePath}/${package} ] 
    then 
        echo "they are have ${package} ";
        echo "<==   excute git pull   ==>";
        cd ${packagePath}/${package};
        git pull;
    else
        echo "<==   clone ${Url}/${package}.git   ==>";
        git clone --depth=1 ${Url}/${package}.git ${packagePath}/${package};
    fi
done
}


function InputPackage
{
cat <<EOF
=====================================
arch       -> golang.org/x/arch
benchmarks -> golang.org/x/benchmarks
blog       -> golang.org/x/blog
build      -> golang.org/x/build
crypto     -> golang.org/x/crypto
debug      -> golang.org/x/debug
exp        -> golang.org/x/exp
image      -> golang.org/x/image
lint       -> golang.org/x/lint
mobile     -> golang.org/x/mobile
net        -> golang.org/x/net
oauth2     -> golang.org/x/oauth2
perf       -> golang.org/x/perf
playground -> golang.org/x/playground
review     -> golang.org/x/review
sync       -> golang.org/x/sync
sys        -> golang.org/x/sys
talks      -> golang.org/x/talks
text       -> golang.org/x/text
time       -> golang.org/x/time
tools      -> golang.org/x/tools
tour       -> golang.org/x/tour
vgo        -> golang.org/x/vgo
=====================================
EOF
echo -n "Input above package:"
read package
Get $package
}


if [ $# -eq 0 ] 
then
    InputPackage;
else
    Get $*;
fi