Puppet::Type.newtype(:entropy_keywords) do
  @desc = "Override keywords for Entropy packages"
  
  ensurable
  
  newparam(:name) do
    desc "Unique name for this keyword entry"
  end

  newproperty(:keyword) do
    desc "Keyword to be applied to matching packages"

    defaultto {
      os = Facter.value(:os)
      if os.key?('architecture')
        os['architecture']
      else
        '**'
      end
    }
  end

  newproperty(:operator) do
    desc "Operator that applies to the version. If not specified, defaults to '=' if a version is provided, not used if no version is provided"
  end

  newproperty(:package) do
    desc "Name of the package being keyworded"
    newvalues(%r{^(?:[A-Za-z0-9+_.-]+\/)?[a-zA-Z0-9+_-]+$})
  end

  newproperty(:version) do
    desc "Version of the package"
    newvalues(%r{^(\d*(?:\.\d+[a-zA-Z]*)*)(?:_((?:alpha|beta|pre|rc)\d*))?(-r\d+)?$})
  end

  newproperty(:repo) do
    desc "Repo for the package"
  end

  newproperty(:target) do
    desc "Location of the package.keywords file being managed"

    defaultto {
      if @resource.class.defaultprovider.ancestors.include?(Puppet::Provider::ParsedFile)
        @resource.class.defaultprovider.default_target
      else
        nil
      end
    }
  end

  validate do
    raise(ArgumentError, "Package is required when a version is specified") if self[:package].nil? && !self[:version].nil?

    raise(ArgumentError, "Version is required when an operator is specified") if self[:version].nil? && !self[:operator].nil?
  end

  autobefore(:package) do
    [self[:package]]
  end
end

# vim: set ts=2 sw=2 expandtab:

