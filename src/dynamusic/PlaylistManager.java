package dynamusic;

import atg.dtm.TransactionDemarcation;
import atg.dtm.TransactionDemarcationException;
import atg.nucleus.GenericService;
import atg.repository.*;

import javax.transaction.SystemException;
import javax.transaction.TransactionManager;
import java.util.Collection;

public class PlaylistManager extends GenericService {
    private Repository userRepository;
    private Repository songsRepository;
    private TransactionManager transactionManager;
    
    public Repository getUserRepository() {
        return userRepository;
    }
    
    public void setUserRepository(Repository userRepository) {
        this.userRepository = userRepository;
    }
    
    public Repository getSongsRepository() {
        return songsRepository;
    }
    
    public void setSongsRepository(Repository songsRepository) {
        this.songsRepository = songsRepository;
    }
    
    public TransactionManager getTransactionManager() {
        return transactionManager;
    }
    
    public void setTransactionManager(TransactionManager transactionManager) {
        this.transactionManager = transactionManager;
    }
    
    /**
     * add  playlist to the user’s playlists property
     */
    public void addPlaylistToUser(String playlistId, String userId) {
        if (isLoggingDebug()) {
            logDebug("adding playlist " + playlistId + " to user " + userId);
        }
        
        TransactionDemarcation transacDemar = new TransactionDemarcation();
        try {
            transacDemar.begin(transactionManager, TransactionDemarcation.REQUIRED);
            
            try {
                MutableRepository mutUserRepository = (MutableRepository) userRepository;
                MutableRepositoryItem user = mutUserRepository.getItemForUpdate(userId, "user");
                RepositoryItem playlist = mutUserRepository.getItem(playlistId, "playlist");
                Collection<RepositoryItem> playlists = (Collection<RepositoryItem>) user.getPropertyValue("playlists");
                playlists.add(playlist);
                user.setPropertyValue("playlists", playlists);
                mutUserRepository.updateItem(user);
            } catch (RepositoryException e) {
                if (isLoggingError()) {
                    logError("Unable to add Playlist to User", e);
                }
                try {
                    transactionManager.setRollbackOnly();
                } catch (SystemException e1) {
                    if (isLoggingError())
                        logError("Rollback failed.", e);
                    
                }
            }
            
        } catch (TransactionDemarcationException e) {
            if (isLoggingError())
                logError("Creating transaction demarcation BEGIN failed, Playlist is not added to User", e);
        } finally {
            try {
                transacDemar.end();
            } catch (TransactionDemarcationException e) {
                if (isLoggingError())
                    logError("Creating transaction demarcation END failed, Playlist is not added to User", e);
            }
        }
    }
    
    /**
     * add  song to the playlist’s songs property
     */
    public void addSongToPlaylist(String playlistId, String songId) throws RepositoryException {
        if (isLoggingDebug()) {
            logDebug("adding song " + songId + " to playlist " + playlistId);
        }
        MutableRepository mutUserRepository = (MutableRepository) userRepository;
        
        MutableRepositoryItem playlist = mutUserRepository.getItemForUpdate(playlistId, "playlist");
        RepositoryItem song = songsRepository.getItem(songId, "song");
        
        Collection<RepositoryItem> songs = (Collection<RepositoryItem>) playlist.getPropertyValue("songs");
        songs.add(song);
        mutUserRepository.updateItem(playlist);
    }
    
}
