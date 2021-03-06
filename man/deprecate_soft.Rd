% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/signal-deprecated.R
\name{deprecate_soft}
\alias{deprecate_soft}
\alias{deprecate_warn}
\alias{deprecate_stop}
\title{Deprecate functions and arguments}
\usage{
deprecate_soft(
  when,
  what,
  with = NULL,
  details = NULL,
  id = NULL,
  env = caller_env(2)
)

deprecate_warn(
  when,
  what,
  with = NULL,
  details = NULL,
  id = NULL,
  env = caller_env(2)
)

deprecate_stop(when, what, with = NULL, details = NULL)
}
\arguments{
\item{when}{The package version when function/argument was deprecated.}

\item{what}{If the deprecated feature is a whole function, the
function name: \code{"foo()"}. If it's an argument that is being
deprecated, the function call should include the argument:
\code{"foo(arg = )"}.

You can optionally supply the namespace: \code{"ns::foo()"}. If not
supplied, it is inferred from the caller environment.}

\item{with}{An optional replacement for the deprecated feature.
This should be a string of the same form as \code{what}.}

\item{details}{The deprecation message is generated from \code{when},
\code{what}, and \code{with}. You can additionally supply a string
\code{details} to be appended to the message.}

\item{id}{The id of the deprecation. A warning is issued only once
for each \code{id}. Defaults to the generated message, but you should
give a unique ID when the message in \code{details} is built
programmatically and depends on inputs, or when you'd like to
deprecate multiple functions but warn only once for all of them.}

\item{env}{The environment in which the deprecated function
was called. A warning is issued if called from the global
environment. If testthat is running, a warning is also called if
the deprecated function was called from the package being tested.

This typically doesn't need to be specified, unless you call
\code{deprecate_soft()} or \code{deprecate_warn()} from an internal helper.
In that case, you need to forward the calling environment.}
}
\value{
\code{NULL}, invisibly.
}
\description{
These functions provide three levels of verbosity for deprecated
functions.
\itemize{
\item \code{deprecate_soft()} warns only if the deprecated function is
called from the global environment (so the user can change their
script) or from the package currently being tested (so the
package developer can fix the package). Use for soft-deprecated
functions.
\item \code{deprecate_warn()} warns unconditionally. Use for deprecated functions.
\item \code{deprecate_stop()} fails unconditionally. Use for defunct functions.
}

Warnings are only issued once every 8 hours to avoid overwhelming
the user. See the \link[=verbosity]{verbosity option} to control this
behaviour.

Deprecation warnings have class
\code{lifecycle_warning_deprecated}. Deprecation errors have class
\code{lifecycle_error_deprecated}.
}
\examples{
# A deprecated function `foo`:
deprecate_warn("1.0.0", "foo()")

# A deprecated argument `arg`:
deprecate_warn("1.0.0", "foo(arg = )")

# A partially deprecated argument `arg`:
deprecate_warn("1.0.0", "foo(arg = 'must be a scalar integer')")

# A deprecated function with a function replacement:
deprecate_warn("1.0.0", "foo()", "bar()")

# A deprecated function with a function replacement from a
# different package:
deprecate_warn("1.0.0", "foo()", "otherpackage::bar()")

# A deprecated function with an argument replacement:
deprecate_warn("1.0.0", "foo()", "foo(bar = )")

}
\seealso{
\code{\link[=lifecycle]{lifecycle()}}
}
