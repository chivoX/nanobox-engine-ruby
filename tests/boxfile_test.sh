echo running tests for ruby
UUID=$(cat /proc/sys/kernel/random/uuid)

pass "unable to start the $VERSION container" docker run --privileged=true -d --name $UUID nanobox/build-ruby sleep 365d

defer docker kill $UUID

pass "unable to create code folder" docker exec $UUID bash -c "cd /opt/engines/ruby/bin; ./boxfile '$(payload default-boxfile)'"
