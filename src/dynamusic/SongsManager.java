package dynamusic;

import atg.nucleus.GenericService;
import atg.repository.*;
import atg.repository.rql.RqlStatement;

public class SongsManager extends GenericService {
    
    private Repository repository;
    
    public SongsManager() {
        super();
    }
    
    public Repository getRepository() {
        return repository;
    }
    
    public void setRepository(Repository repository) {
        this.repository = repository;
    }
    
    public void deleteAlbumsByArtist(String artistId) throws RepositoryException {
        if (isLoggingDebug()) {
            logDebug("Deleting albums by artist id " + artistId);
        }
        
        MutableRepository mutRepos = (MutableRepository) repository;
        
        RqlStatement findAlbumRQL = RqlStatement.parseRqlStatement("artist.id = ?0");
        RepositoryView albumView = repository.getView("album");
        
        Object[] rqlparams = new Object[1];
        rqlparams[0] = artistId;
        
        RepositoryItem[] albumList = findAlbumRQL.executeQuery(albumView, rqlparams);
        if (isLoggingDebug())
            logDebug("found albums for artist: " + albumList);
        if (albumList != null) {
            for (RepositoryItem album : albumList) {
                String albumId = (String) album.getPropertyValue("id");
                mutRepos.removeItem(album.getRepositoryId(), "album");
                
                if (isLoggingDebug()) {
                    logDebug("album id=" + albumId + " is deleted.");
                }
            }
        }
    }
    
}
