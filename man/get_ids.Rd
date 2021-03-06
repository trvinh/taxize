% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_ids.R
\name{get_ids}
\alias{get_ids}
\alias{get_ids_}
\title{Retrieve taxonomic identifiers for a given taxon name.}
\usage{
get_ids(
  sci_com,
  db = c("itis", "ncbi", "eol", "tropicos", "gbif", "nbn", "pow"),
  suppress = FALSE,
  names = NULL,
  ...
)

get_ids_(
  sci_com,
  db = get_ids_dbs,
  rows = NA,
  suppress = FALSE,
  names = NULL,
  ...
)
}
\arguments{
\item{sci_com}{(character) Taxonomic name to query.}

\item{db}{(character) database to query. One or more of \code{ncbi}, \code{itis}, \code{eol},
\code{tropicos}, \code{gbif}, \code{nbn}, or \code{pow}. By default db is set to search
all data sources. Note that each taxonomic data source has their own
identifiers, so that if you give the wrong \code{db} value for the identifier you
could get a result, it will likely be wrong (not what you were expecting).
If using ncbi and/or tropicos we recommend getting API keys;
see \link{taxize-authentication}}

\item{suppress}{(logical) suppress \pkg{cli} separators with the database
name being queried. default: \code{FALSE}}

\item{names}{Deprecated, see \code{sci_com}}

\item{...}{Other arguments passed to \code{\link[=get_tsn]{get_tsn()}}, \code{\link[=get_uid]{get_uid()}},
\code{\link[=get_eolid]{get_eolid()}}, \code{\link[=get_tpsid]{get_tpsid()}}, \code{\link[=get_gbifid]{get_gbifid()}},
\code{\link[=get_nbnid]{get_nbnid()}}.}

\item{rows}{(numeric) Any number from 1 to infinity. If the default NA, all
rows are returned. When used in \code{get_ids} this function still only
gives back a ids class object with one to many identifiers. See
\code{get_ids_} to get back all, or a subset, of the raw data that you
are presented during the ask process.}
}
\value{
A vector of taxonomic identifiers, each retaining their respective
S3 classes so that each element can be passed on to another function
(see e.g.'s).
}
\description{
This is a convenience function to get identifiers across all data sources.
You can use other \verb{get_*} functions to get identifiers from specific
sources if you like.
}
\note{
There is a timeout of 1/3 seconds between queries to NCBI.
}
\section{Authentication}{

See \link{taxize-authentication} for help on authentication
}

\examples{
\dontrun{
# Plug in taxon names directly
## By default you get ids for all data sources
get_ids("Chironomus riparius")

# specify rows to limit choices available
get_ids("Poa annua", db="eol", rows=1)
get_ids("Poa annua", db="eol", rows=1:2)

## Or you can specify which source you want via the db parameter
get_ids("Chironomus riparius", db = 'ncbi')
get_ids("Salvelinus fontinalis", db = 'nbn')

get_ids(c("Chironomus riparius", "Pinus contorta"), db = 'ncbi')
get_ids(c("Chironomus riparius", "Pinus contorta"),
  db = c('ncbi','itis'))
get_ids(c("Chironomus riparius", "Pinus contorta"),
  db = c('ncbi','itis'))
get_ids("Pinus contorta",
  db = c('ncbi','itis','eol','tropicos'))
get_ids("ava avvva", db = c('ncbi','itis','eol','tropicos'))

# Pass on to other functions
out <- get_ids("Pinus contorta",
 db = c('ncbi','itis','eol','tropicos'))
classification(out$itis)
synonyms(out$tropicos)

# Get all data back
get_ids_(c("Chironomus riparius", "Pinus contorta"), db = 'nbn',
  rows=1:10)
get_ids_(c("Chironomus riparius", "Pinus contorta"), db = c('nbn','gbif'),
  rows=1:10)

# use curl options
get_ids("Agapostemon", db = "ncbi", verbose = TRUE)
}
}
\seealso{
\code{\link[=classification]{classification()}}

Other taxonomic-ids: 
\code{\link{get_boldid}()},
\code{\link{get_eolid}()},
\code{\link{get_gbifid}()},
\code{\link{get_iucn}()},
\code{\link{get_natservid}()},
\code{\link{get_nbnid}()},
\code{\link{get_pow}()},
\code{\link{get_tolid}()},
\code{\link{get_tpsid}()},
\code{\link{get_tsn}()},
\code{\link{get_uid}()},
\code{\link{get_wiki}()},
\code{\link{get_wormsid}()}
}
\concept{taxonomic-ids}
