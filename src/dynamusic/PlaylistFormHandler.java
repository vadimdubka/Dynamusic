package dynamusic;

import atg.droplet.DropletException;
import atg.repository.Repository;
import atg.repository.RepositoryException;
import atg.repository.servlet.RepositoryFormHandler;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;

import javax.servlet.ServletException;
import java.io.IOException;

public class PlaylistFormHandler extends RepositoryFormHandler {
    private String songId;
    private String userId;
    private String addSongSuccessURL;
    private String addSongErrorURL;
    private PlaylistManager playlistManager;
    
    public String getSongId() {
        return songId;
    }
    
    public void setSongId(String songId) {
        this.songId = songId;
    }
    
    public String getUserId() {
        return userId;
    }
    
    public void setUserId(String userId) {
        this.userId = userId;
    }
    
    public String getAddSongSuccessURL() {
        return addSongSuccessURL;
    }
    
    public void setAddSongSuccessURL(String addSongSuccessURL) {
        this.addSongSuccessURL = addSongSuccessURL;
    }
    
    public String getAddSongErrorURL() {
        return addSongErrorURL;
    }
    
    public void setAddSongErrorURL(String addSongErrorURL) {
        this.addSongErrorURL = addSongErrorURL;
    }
    
    public PlaylistManager getPlaylistManager() {
        return playlistManager;
    }
    
    public void setPlaylistManager(PlaylistManager playlistManager) {
        this.playlistManager = playlistManager;
    }
    
    /**
     * after a new playlist is created, it is added to the user playlists property
     */
    @Override
    protected void postCreateItem(DynamoHttpServletRequest pRequest, DynamoHttpServletResponse pResponse) throws ServletException, IOException {
        if (isLoggingDebug())
            logDebug("postCreateItem called, item created: " + getRepositoryItem());
        
        Repository repository = getRepository();
        String playlistId = getRepositoryId();
        
        if (playlistManager != null) {
            playlistManager.addPlaylistToUser(playlistId, userId);
        } else {
            if (isLoggingWarning())
                logWarning("Playlistmanager is not set.");
        }
        
    }
    
    /**
     * add the song to the playlist’s songs property using the configured PlaylistManager
     */
    public boolean handleAddSong(DynamoHttpServletRequest request, DynamoHttpServletResponse response) throws IOException {
        if (isLoggingDebug()) {
            logDebug("HandleAddSong called");
        }
        
        try {
            playlistManager.addSongToPlaylist(getRepositoryId(), songId);
        } catch (RepositoryException e) {
            if (isLoggingError())
                logError(e);
            addFormException(new DropletException("Cannot add song to playlist", e));
        }
        
        if (getFormError()) {
            if (isLoggingDebug()) {
                logDebug("add song was un-successful");
            }
            if (addSongErrorURL != null) {
                if (isLoggingDebug()) {
                    logDebug("redirecting to " + addSongErrorURL);
                }
                response.sendLocalRedirect(addSongErrorURL, request);
                return false;
            } else {
                return true;
            }
        }
        if (isLoggingDebug()) {
            logDebug("add song was successful");
        }
        if (addSongSuccessURL != null) {
            if (isLoggingDebug()) {
                logDebug("redirecting to " + addSongSuccessURL);
            }
            response.sendLocalRedirect(addSongSuccessURL, request);
            return false;
        }
        return true;
    }
}