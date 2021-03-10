eisvogel <- function(toc = TRUE) {
    # locations of resource files in the package
    pkg_resource <- function(...) {
        system.file(..., package = "eisvogel")
    }

    # css    = pkg_resource("reports/styles.css")
    # header = pkg_resource("reports/quarterly/header.html")

    # # call the base html_document function
    # rmarkdown::html_document(
    #     toc = toc, fig_width = 6.5, fig_height = 4,
    #     theme = NULL, css = css,
    #     includes = rmarkdown::includes(before_body = header)
    # )

    tex <- pkg_resource("resources/eisvogel.tex")

    # call the base pdf_document function
    rmarkdown::pdf_document(
        keep_tex = TRUE,
        latex_engine = "lualatex",
        template = "resources/eisvogel.tex",
        extra_dependencies = "booktabs",
        toc = TRUE
    )
}


#' @importFrom rmarkdown output_format knitr_options pandoc_options
simple_pdf_format <- function() {
    # if you don't use roxygen2 (see above), you need to either
    # library(rmarkdown) or use rmarkdown::
    output_format(
        knitr = knitr_options(opts_chunk = list(dev = 'png')),
        pandoc = pandoc_options(to = "pdf"),
        clean_supporting = FALSE
    )
}


