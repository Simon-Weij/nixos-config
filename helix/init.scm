(require "forest/forest.scm")
(require "smooth-scroll/smooth-scroll.scm")

(forest-configure! 'left #:ignore (list ".git" "dist" "node_modules"))
(forest-set-style! 'mini)
