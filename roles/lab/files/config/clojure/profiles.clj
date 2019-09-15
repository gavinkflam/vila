{:user
 {:dependencies [[cider/cider-nrepl "0.22.2"]
                 [iced-nrepl "0.6.3"]
                 [nrepl "0.6.0"]]
  :repl-options {:nrepl-middleware [cider.nrepl/wrap-classpath
                                    cider.nrepl/wrap-clojuredocs
                                    cider.nrepl/wrap-complete
                                    cider.nrepl/wrap-debug
                                    cider.nrepl/wrap-format
                                    cider.nrepl/wrap-info
                                    cider.nrepl/wrap-macroexpand
                                    cider.nrepl/wrap-ns
                                    cider.nrepl/wrap-out
                                    cider.nrepl/wrap-spec
                                    cider.nrepl/wrap-test
                                    cider.nrepl/wrap-trace
                                    cider.nrepl/wrap-undef
                                    cider.nrepl/wrap-xref
                                    iced.nrepl/wrap-iced]}
  :plugins [[refactor-nrepl "2.4.0"]]}}
