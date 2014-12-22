# REINDEX FOR SEARCHKICK
every 10.minutes do
  rake "searchkick:reindex CLASS=Contact"
end
