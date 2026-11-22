
require 'jekyll'

Jekyll::Hooks.register :site, :after_init do |site|
  script = File.join(site.source, 'run.sh')

  if File.file?(script)
    system('bash', script)
    raise 'run.sh execution failed' unless $?.success?
  end
end
