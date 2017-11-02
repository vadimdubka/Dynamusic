package dynamusic;

import atg.dtm.TransactionDemarcation;
import atg.dtm.TransactionDemarcationException;
import atg.nucleus.GenericService;
import atg.repository.*;
import atg.repository.rql.RqlStatement;

import javax.transaction.SystemException;
import javax.transaction.TransactionManager;

public class SongsManager extends GenericService {
    
    private Repository repository;
    private TransactionManager transactionManager;
    
    public Repository getRepository() {
        return repository;
    }
    
    public void setRepository(Repository repository) {
        this.repository = repository;
    }
    
    public TransactionManager getTransactionManager() {
        return transactionManager;
    }
    
    public void setTransactionManager(TransactionManager transactionManager) {
        this.transactionManager = transactionManager;
    }
    
    public void deleteAlbumsByArtist(String artistId) throws RepositoryException {
        if (isLoggingDebug()) {
            logDebug("Deleting albums by artist id " + artistId);
        }
        
        MutableRepository mutRepos = (MutableRepository) repository;
        
        TransactionDemarcation transacDemar = new TransactionDemarcation();
        try {
            transacDemar.begin(transactionManager, TransactionDemarcation.REQUIRED);
            
            try {
                RqlStatement findAlbumRQL = RqlStatement.parseRqlStatement("artist.id = ?0");
                RepositoryView albumView = repository.getView("album");
                
                Object[] rqlparams = new Object[1];
                rqlparams[0] = artistId;
                
                RepositoryItem[] albumList = findAlbumRQL.executeQuery(albumView, rqlparams);
                
                if (isLoggingDebug()) {
                    logDebug("found albums for artist: " + albumList);
                }
                
                
                if (albumList != null) {
                    for (RepositoryItem album : albumList) {
                        String albumId = (String) album.getPropertyValue("id");
                        
                        mutRepos.removeItem(album.getRepositoryId(), "album");
                        
                        
                        if (isLoggingDebug()) {
                            logDebug("album id=" + albumId + " is deleted.");
                        }
                    }
                }
                
            } catch (RepositoryException e) {
                if (isLoggingError()) {
                    logError("Unable to delete album", e);
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
                logError("Creating transaction demarcation BEGIN failed, no albums deleted", e);
        } finally {
            try {
                transacDemar.end();
            } catch (TransactionDemarcationException e) {
                if (isLoggingError())
                    logError("Creating transaction demarcation END failed, no albums deleted", e);
            }
        }
    }
    
}
