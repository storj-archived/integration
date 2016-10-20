root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

modules=( "storj-bridge" \
          "storj-complex" \
          "storj-lib" \
          "storj-mongodb-adapter" \
          "storj-service-auditor" \
          "storj-service-error-types" \
          "storj-service-mailer" \
          "storj-service-middleware" \
          "storj-service-storage-models" \
          "storjshare-cli" )

for i in "${modules[@]}"
do
    module_dir="${root_dir}/${i}"
    pushd "${module_dir}"
    npm install
    npm link
    popd
done

for i in "${modules[@]}"
do
    module_dir="${root_dir}/${i}"
    for j in "${modules[@]}"
    do
        if [ -d "${module_dir}/node_modules/${j}" ]; then
            pushd "${module_dir}"            
            npm link "${j}"
            popd            
        fi
    done
done
