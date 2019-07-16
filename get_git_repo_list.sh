for d in ./vim/bundle/*/ ;
do
    (cd "$d" && git config --get remote.origin.url && cd ..);
done
#> git_plugin_list.txt
