# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `code_ownership` gem.
# Please instead update this file by running `bin/tapioca gem code_ownership`.

module CodeOwnership
  extend ::CodeOwnership

  requires_ancestor { Kernel }

  sig do
    params(
      backtrace: T.nilable(T::Array[::String]),
      excluded_teams: T::Array[::CodeTeams::Team]
    ).returns(T.nilable(::CodeTeams::Team))
  end
  def for_backtrace(backtrace, excluded_teams: T.unsafe(nil)); end

  sig { params(klass: T.nilable(T.any(::Class, ::Module))).returns(T.nilable(::CodeTeams::Team)) }
  def for_class(klass); end

  sig { params(file: ::String).returns(T.nilable(::CodeTeams::Team)) }
  def for_file(file); end

  sig { params(package: ::ParsePackwerk::Package).returns(T.nilable(::CodeTeams::Team)) }
  def for_package(package); end

  sig { params(files: T::Array[::String], autocorrect: T::Boolean, stage_changes: T::Boolean).void }
  def validate!(files: T.unsafe(nil), autocorrect: T.unsafe(nil), stage_changes: T.unsafe(nil)); end

  class << self
    sig { void }
    def bust_caches!; end

    sig { params(filename: ::String).void }
    def remove_file_annotation!(filename); end
  end
end

class CodeOwnership::Cli
  class << self
    def for_file(argv); end
    def run!(argv); end

    private

    def validate!(argv); end
  end
end

class CodeOwnership::InvalidCodeOwnershipConfigurationError < ::StandardError; end

module CodeOwnership::Private
  class << self
    sig { void }
    def bust_caches!; end

    sig { returns(::CodeOwnership::Private::Configuration) }
    def configuration; end

    sig { returns(::CodeOwnership::Private::OwnershipMappers::FileAnnotations) }
    def file_annotations_mapper; end

    sig { params(files: T::Array[::String]).returns(T::Hash[::String, T::Array[::String]]) }
    def files_by_mapper(files); end

    sig { params(team_name: ::String, location_of_reference: ::String).returns(::CodeTeams::Team) }
    def find_team!(team_name, location_of_reference); end

    sig { returns(T::Array[::CodeOwnership::Private::OwnershipMappers::Interface]) }
    def mappers; end

    sig { params(klass: T.nilable(T.any(::Class, ::Module))).returns(T.nilable(::String)) }
    def path_from_klass(klass); end

    sig { returns(T::Array[::String]) }
    def tracked_files; end

    sig { params(files: T::Array[::String], autocorrect: T::Boolean, stage_changes: T::Boolean).void }
    def validate!(files:, autocorrect: T.unsafe(nil), stage_changes: T.unsafe(nil)); end
  end
end

class CodeOwnership::Private::Configuration < ::T::Struct
  const :js_package_paths, T::Array[::String]
  const :owned_globs, T::Array[::String]
  const :skip_codeowners_validation, T::Boolean
  const :unowned_globs, T::Array[::String]

  class << self
    sig { returns(::CodeOwnership::Private::Configuration) }
    def fetch; end

    def inherited(s); end

    sig { params(config_hash: T::Hash[T.untyped, T.untyped]).returns(T::Array[::String]) }
    def js_package_paths(config_hash); end
  end
end

CodeOwnership::Private::Configuration::DEFAULT_JS_PACKAGE_PATHS = T.let(T.unsafe(nil), Array)
module CodeOwnership::Private::OwnershipMappers; end

class CodeOwnership::Private::OwnershipMappers::FileAnnotations
  include ::CodeOwnership::Private::OwnershipMappers::Interface

  sig { override.void }
  def bust_caches!; end

  sig { override.returns(T::Hash[::String, T.nilable(::CodeTeams::Team)]) }
  def codeowners_lines_to_owners; end

  sig { override.returns(::String) }
  def description; end

  sig { params(filename: ::String).returns(T.nilable(::CodeTeams::Team)) }
  def file_annotation_based_owner(filename); end

  sig { override.params(file: ::String).returns(T.nilable(::CodeTeams::Team)) }
  def map_file_to_owner(file); end

  sig { override.params(files: T::Array[::String]).returns(T::Hash[::String, T.nilable(::CodeTeams::Team)]) }
  def map_files_to_owners(files); end

  sig { params(filename: ::String).void }
  def remove_file_annotation!(filename); end
end

CodeOwnership::Private::OwnershipMappers::FileAnnotations::TEAM_PATTERN = T.let(T.unsafe(nil), Regexp)

module CodeOwnership::Private::OwnershipMappers::Interface
  interface!

  sig { abstract.void }
  def bust_caches!; end

  sig { abstract.returns(T::Hash[::String, T.nilable(::CodeTeams::Team)]) }
  def codeowners_lines_to_owners; end

  sig { abstract.returns(::String) }
  def description; end

  sig { abstract.params(file: ::String).returns(T.nilable(::CodeTeams::Team)) }
  def map_file_to_owner(file); end

  sig { abstract.params(files: T::Array[::String]).returns(T::Hash[::String, T.nilable(::CodeTeams::Team)]) }
  def map_files_to_owners(files); end
end

class CodeOwnership::Private::OwnershipMappers::JsPackageOwnership
  include ::CodeOwnership::Private::OwnershipMappers::Interface

  sig { override.void }
  def bust_caches!; end

  sig { override.returns(T::Hash[::String, T.nilable(::CodeTeams::Team)]) }
  def codeowners_lines_to_owners; end

  sig { override.returns(::String) }
  def description; end

  sig { override.params(file: ::String).returns(T.nilable(::CodeTeams::Team)) }
  def map_file_to_owner(file); end

  sig { override.params(files: T::Array[::String]).returns(T::Hash[::String, T.nilable(::CodeTeams::Team)]) }
  def map_files_to_owners(files); end

  sig { params(package: ::CodeOwnership::Private::ParseJsPackages::Package).returns(T.nilable(::CodeTeams::Team)) }
  def owner_for_package(package); end

  private

  sig { params(file: ::String).returns(T.nilable(::CodeOwnership::Private::ParseJsPackages::Package)) }
  def map_file_to_relevant_package(file); end
end

class CodeOwnership::Private::OwnershipMappers::PackageOwnership
  include ::CodeOwnership::Private::OwnershipMappers::Interface

  sig { override.void }
  def bust_caches!; end

  sig { override.returns(T::Hash[::String, T.nilable(::CodeTeams::Team)]) }
  def codeowners_lines_to_owners; end

  sig { override.returns(::String) }
  def description; end

  sig { override.params(file: ::String).returns(T.nilable(::CodeTeams::Team)) }
  def map_file_to_owner(file); end

  sig { override.params(files: T::Array[::String]).returns(T::Hash[::String, T.nilable(::CodeTeams::Team)]) }
  def map_files_to_owners(files); end

  sig { params(package: ::ParsePackwerk::Package).returns(T.nilable(::CodeTeams::Team)) }
  def owner_for_package(package); end

  private

  sig { params(file: ::String).returns(T.nilable(::ParsePackwerk::Package)) }
  def map_file_to_relevant_package(file); end
end

class CodeOwnership::Private::OwnershipMappers::TeamGlobs
  include ::CodeOwnership::Private::OwnershipMappers::Interface

  sig { override.void }
  def bust_caches!; end

  sig { override.returns(T::Hash[::String, T.nilable(::CodeTeams::Team)]) }
  def codeowners_lines_to_owners; end

  sig { override.returns(::String) }
  def description; end

  sig { override.params(file: ::String).returns(T.nilable(::CodeTeams::Team)) }
  def map_file_to_owner(file); end

  sig { override.params(files: T::Array[::String]).returns(T::Hash[::String, T.nilable(::CodeTeams::Team)]) }
  def map_files_to_owners(files); end
end

module CodeOwnership::Private::ParseJsPackages
  class << self
    sig { returns(T::Array[::CodeOwnership::Private::ParseJsPackages::Package]) }
    def all; end
  end
end

CodeOwnership::Private::ParseJsPackages::METADATA = T.let(T.unsafe(nil), String)
CodeOwnership::Private::ParseJsPackages::PACKAGE_JSON_NAME = T.let(T.unsafe(nil), String)

class CodeOwnership::Private::ParseJsPackages::Package < ::T::Struct
  const :metadata, T::Hash[::String, T.untyped]
  const :name, ::String

  sig { returns(::Pathname) }
  def directory; end

  class << self
    sig { params(pathname: ::Pathname).returns(::CodeOwnership::Private::ParseJsPackages::Package) }
    def from(pathname); end

    def inherited(s); end
  end
end

CodeOwnership::Private::ParseJsPackages::ROOT_PACKAGE_NAME = T.let(T.unsafe(nil), String)
module CodeOwnership::Private::TeamPlugins; end

class CodeOwnership::Private::TeamPlugins::Github < ::CodeTeams::Plugin
  sig { returns(::CodeOwnership::Private::TeamPlugins::Github::GithubStruct) }
  def github; end
end

class CodeOwnership::Private::TeamPlugins::Github::GithubStruct < ::Struct
  def do_not_add_to_codeowners_file; end
  def do_not_add_to_codeowners_file=(_); end
  def team; end
  def team=(_); end

  class << self
    def [](*_arg0); end
    def inspect; end
    def members; end
    def new(*_arg0); end
  end
end

class CodeOwnership::Private::TeamPlugins::Ownership < ::CodeTeams::Plugin
  sig { returns(T::Array[::String]) }
  def owned_globs; end
end

module CodeOwnership::Private::Validations; end

class CodeOwnership::Private::Validations::FilesHaveOwners
  include ::CodeOwnership::Private::Validations::Interface

  sig do
    override
      .params(
        files: T::Array[::String],
        autocorrect: T::Boolean,
        stage_changes: T::Boolean
      ).returns(T::Array[::String])
  end
  def validation_errors(files:, autocorrect: T.unsafe(nil), stage_changes: T.unsafe(nil)); end
end

class CodeOwnership::Private::Validations::FilesHaveUniqueOwners
  include ::CodeOwnership::Private::Validations::Interface

  sig do
    override
      .params(
        files: T::Array[::String],
        autocorrect: T::Boolean,
        stage_changes: T::Boolean
      ).returns(T::Array[::String])
  end
  def validation_errors(files:, autocorrect: T.unsafe(nil), stage_changes: T.unsafe(nil)); end
end

class CodeOwnership::Private::Validations::GithubCodeownersUpToDate
  include ::CodeOwnership::Private::Validations::Interface

  sig do
    override
      .params(
        files: T::Array[::String],
        autocorrect: T::Boolean,
        stage_changes: T::Boolean
      ).returns(T::Array[::String])
  end
  def validation_errors(files:, autocorrect: T.unsafe(nil), stage_changes: T.unsafe(nil)); end

  private

  sig { returns(T::Array[::String]) }
  def codeowners_file_lines; end
end

module CodeOwnership::Private::Validations::Interface
  interface!

  sig do
    abstract
      .params(
        files: T::Array[::String],
        autocorrect: T::Boolean,
        stage_changes: T::Boolean
      ).returns(T::Array[::String])
  end
  def validation_errors(files:, autocorrect: T.unsafe(nil), stage_changes: T.unsafe(nil)); end
end
