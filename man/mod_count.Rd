% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mod_count.R
\name{mod_count_ui}
\alias{mod_count_ui}
\alias{mod_count_server}
\title{mod_count_ui and mod_count_server}
\usage{
mod_count_ui(id, label, source = "John Hopkins", color = "#fff")

mod_count_server(
  input,
  output,
  session,
  df = data.frame(),
  type_filter = "confirmed"
)
}
\arguments{
\item{id}{shiny id}

\item{input}{internal}

\item{output}{internal}

\item{session}{internal}
}
\description{
A shiny Module.
}
\keyword{internal}
