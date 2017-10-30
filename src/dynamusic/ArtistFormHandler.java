package dynamusic;

import atg.droplet.DropletException;
import atg.repository.RepositoryException;
import atg.repository.RepositoryItem;
import atg.repository.servlet.RepositoryFormHandler;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;

import javax.servlet.ServletException;
import java.io.IOException;

public class ArtistFormHandler extends RepositoryFormHandler {
    private SongsManager songsManager;
    private String userId;
    
    public ArtistFormHandler() {
    }
    
    public SongsManager getSongsManager() {
        return songsManager;
    }
    
    public void setSongsManager(SongsManager songsManager) {
        this.songsManager = songsManager;
    }
    
    public String getUserId() {
        return userId;
    }
    
    public void setUserId(String userId) {
        this.userId = userId;
    }
    
    @Override
    protected void preDeleteItem(DynamoHttpServletRequest pRequest, DynamoHttpServletResponse pResponse) throws ServletException, IOException {
        
        RepositoryItem artist = getRepositoryItem();
        String artistId = artist.getRepositoryId();
        
        if (isLoggingDebug()) {
            logDebug("ArtistFormHandler preDeleteItem method is invoked for the artist id=" + artistId);
        }
        
        if (songsManager != null) {
            try {
                songsManager.deleteAlbumsByArtist(artistId);
            } catch (RepositoryException e) {
                if (isLoggingError()) {
                    logError("Cannot delete albums by artist", e);
                }
                addFormException(new DropletException("Cannot delete albums by artist"));
            }
        } else {
            if (isLoggingWarning())
                logWarning("Songs manager has not been set.");
        }
    }
}
