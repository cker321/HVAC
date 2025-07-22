package com.yanzhenjie.andserver.http.multipart;

import com.yanzhenjie.andserver.util.IOUtils;
import com.yanzhenjie.andserver.util.MediaType;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.eclipse.paho.client.mqttv3.MqttTopic;

/* loaded from: classes.dex */
public class StandardMultipartFile implements MultipartFile, Serializable {
    private final FileItem fileItem;
    private final long size;

    public StandardMultipartFile(FileItem fileItem) {
        this.fileItem = fileItem;
        this.size = fileItem.getSize();
    }

    public final FileItem getFileItem() {
        return this.fileItem;
    }

    @Override // com.yanzhenjie.andserver.http.multipart.MultipartFile
    public String getName() {
        return this.fileItem.getFieldName();
    }

    @Override // com.yanzhenjie.andserver.http.multipart.MultipartFile
    public String getFilename() {
        String name = this.fileItem.getName();
        if (name == null) {
            return "";
        }
        int iLastIndexOf = name.lastIndexOf(MqttTopic.TOPIC_LEVEL_SEPARATOR);
        int iLastIndexOf2 = name.lastIndexOf("\\");
        if (iLastIndexOf2 > iLastIndexOf) {
            iLastIndexOf = iLastIndexOf2;
        }
        return iLastIndexOf != -1 ? name.substring(iLastIndexOf + 1) : name;
    }

    @Override // com.yanzhenjie.andserver.http.multipart.MultipartFile
    public MediaType getContentType() {
        try {
            return MediaType.parseMediaType(this.fileItem.getContentType());
        } catch (Exception unused) {
            return MediaType.APPLICATION_OCTET_STREAM;
        }
    }

    @Override // com.yanzhenjie.andserver.http.multipart.MultipartFile
    public boolean isEmpty() {
        return this.size == 0;
    }

    @Override // com.yanzhenjie.andserver.http.multipart.MultipartFile
    public long getSize() {
        return this.size;
    }

    @Override // com.yanzhenjie.andserver.http.multipart.MultipartFile
    public byte[] getBytes() {
        if (!isAvailable()) {
            throw new IllegalStateException("File has been moved - cannot be read again.");
        }
        byte[] bArr = this.fileItem.get();
        return bArr != null ? bArr : new byte[0];
    }

    @Override // com.yanzhenjie.andserver.http.multipart.MultipartFile
    public InputStream getStream() throws IOException {
        if (!isAvailable()) {
            throw new IllegalStateException("File has been moved - cannot be read again.");
        }
        InputStream inputStream = this.fileItem.getInputStream();
        return inputStream != null ? inputStream : IOUtils.createEmptyInput();
    }

    @Override // com.yanzhenjie.andserver.http.multipart.MultipartFile
    public void transferTo(File file) throws IllegalStateException, IOException {
        if (!isAvailable()) {
            throw new IllegalStateException("File has already been moved - cannot be transferred again.");
        }
        if (file.exists() && !file.delete()) {
            throw new IOException("Destination file [" + file.getAbsolutePath() + "] already exists and could not be deleted.");
        }
        try {
            this.fileItem.write(file);
        } catch (IOException e) {
            throw e;
        } catch (IllegalStateException e2) {
            throw e2;
        } catch (FileUploadException e3) {
            throw new IllegalStateException(e3.getMessage(), e3);
        } catch (Exception e4) {
            throw new IOException("File transfer failed", e4);
        }
    }

    protected boolean isAvailable() {
        if (this.fileItem.isInMemory()) {
            return true;
        }
        FileItem fileItem = this.fileItem;
        if (fileItem instanceof DiskFileItem) {
            return ((DiskFileItem) fileItem).getStoreLocation().exists();
        }
        return fileItem.getSize() == this.size;
    }
}
